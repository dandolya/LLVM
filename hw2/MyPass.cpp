#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Verifier.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "queue"
#include "set"
using namespace llvm;

struct MyModPass : public PassInfoMixin<MyModPass> {

  bool isFuncLogger(StringRef name) {
    return name == "usersAndOperandsLogger";
  }

  PreservedAnalyses run(Module &M, ModuleAnalysisManager &AM) {
    outs() << "[Module] " << M.getName() << '\n';
    for (auto &F : M) {
      outs() << "[Function] " << F.getName() << " (arg_size: " << F.arg_size()
             << ")\n";
      if (isFuncLogger(F.getName()) || F.isDeclaration()) {
        continue;
      }

      for (auto &B : F) {
        for (auto &I : B) {
          // Dump Instructions
          outs() << "Instruction: " << (uint64_t)(&I) << '\n';
          I.print(outs(), true);
          outs() << '\n';
        }
      }

      // Prepare builder for IR modification
      LLVMContext &Ctx = F.getContext();
      IRBuilder<> builder(Ctx);
      Type *retType = Type::getVoidTy(Ctx);
      Type *int8PtrTy = Type::getInt8Ty(Ctx)->getPointerTo();
      Type *int32Ty = Type::getInt32Ty(Ctx);
      Type *int64Ty = Type::getInt64Ty(Ctx);

      // Prepare usersAndOperandsLogger
      ArrayRef<Type *> usersAndOperandsParamTypes = {int8PtrTy,   int8PtrTy};
      FunctionType *usersAndOperandsLogFuncType =
          FunctionType::get(retType, usersAndOperandsParamTypes, false);
      FunctionCallee usersAndOperandsLogFunc =
          M.getOrInsertFunction("usersAndOperandsLogger", usersAndOperandsLogFuncType);
      Function *logFunc = dyn_cast<Function>(usersAndOperandsLogFunc.getCallee());

      for (auto &B : F) {
        for (auto &I : B) {
          if (isFuncLogger((&I)->getOpcodeName()) || isa<PHINode>(&I)) {
              continue;
          }
          builder.SetInsertPoint(&I);
          Value *user = builder.CreateGlobalStringPtr((&I)->getOpcodeName());
          std::queue<Value *> operands({I.op_begin(), I.op_end()});
          std::set<Value *> visited;
          while (!operands.empty()) {
            Value *U = operands.front();
            visited.insert(U);
            operands.pop();
            if (auto *operand = dyn_cast<Instruction>(U)) {
              if (isa<PHINode>(operand)) {
                for (Use &U : operand->operands()) {
                  if (visited.find(U.get()) == visited.end()) {
                    operands.push(U.get());
                  }
                }
              } else {
                Value *operandName = builder.CreateGlobalStringPtr(operand->getOpcodeName());
                Value *args[] = {user, operandName};
                builder.CreateCall(usersAndOperandsLogFunc, args);
              }
            }
          }
        }
      }
      outs() << '\n';
      bool verif = verifyFunction(F, &outs());
      outs() << "[VERIFICATION] " << (verif ? "FAIL\n\n" : "OK\n\n");
    }
    outs() << '\n';
    return PreservedAnalyses::none();
  };
};

PassPluginLibraryInfo getPassPluginInfo() {
  const auto callback = [](PassBuilder &PB) {
    PB.registerOptimizerLastEPCallback([](ModulePassManager &MPM, auto) {
      MPM.addPass(MyModPass{});
      return true;
    });
  };

  return {LLVM_PLUGIN_API_VERSION, "MyPlugin", "0.0.1", callback};
};

/* When a plugin is loaded by the driver, it will call this entry point to
obtain information about this plugin and about how to register its passes.
*/
extern "C" LLVM_ATTRIBUTE_WEAK PassPluginLibraryInfo llvmGetPassPluginInfo() {
  return getPassPluginInfo();
}
