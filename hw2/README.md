```
clang++ MyPass.cpp -fPIC -shared -I$(llvm-config --includedir) -o libPass.so
clang ../hw1/app.c -emit-llvm -S -fpass-plugin=./libPass.so -O2
clang ../hw1/start.c ../hw1/sim.c app.ll -lSDL2 log.c -O2
./a.out
```
