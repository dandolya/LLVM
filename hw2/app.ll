; ModuleID = '../hw1/app.c'
source_filename = "../hw1/app.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@0 = private unnamed_addr constant [5 x i8] c"zext\00", align 1
@1 = private unnamed_addr constant [6 x i8] c"trunc\00", align 1
@2 = private unnamed_addr constant [4 x i8] c"add\00", align 1
@3 = private unnamed_addr constant [3 x i8] c"br\00", align 1
@4 = private unnamed_addr constant [5 x i8] c"call\00", align 1
@5 = private unnamed_addr constant [5 x i8] c"srem\00", align 1
@6 = private unnamed_addr constant [7 x i8] c"alloca\00", align 1
@7 = private unnamed_addr constant [5 x i8] c"sext\00", align 1
@8 = private unnamed_addr constant [5 x i8] c"icmp\00", align 1
@9 = private unnamed_addr constant [5 x i8] c"load\00", align 1
@10 = private unnamed_addr constant [6 x i8] c"store\00", align 1
@11 = private unnamed_addr constant [7 x i8] c"select\00", align 1
@12 = private unnamed_addr constant [14 x i8] c"getelementptr\00", align 1

; Function Attrs: nounwind uwtable
define dso_local void @paint(i32 noundef %0, ptr nocapture noundef %1, ptr nocapture noundef readonly %2, ptr noundef %3, ptr noundef %4) local_unnamed_addr #0 {
  br label %6

6:                                                ; preds = %5, %11
  %7 = phi i64 [ 0, %5 ], [ %12, %11 ]
  %8 = phi i32 [ 0, %5 ], [ %34, %11 ]
  call void @usersAndOperandsLogger(ptr @1, ptr @2)
  %9 = trunc i64 %7 to i32
  br label %14

10:                                               ; preds = %11
  call void @usersAndOperandsLogger(ptr @4, ptr @2)
  tail call void @simPutPixels(ptr noundef %3, ptr noundef %4, i32 noundef %0, i32 noundef %34) #5
  ret void

11:                                               ; preds = %33
  call void @usersAndOperandsLogger(ptr @2, ptr @2)
  %12 = add nuw nsw i64 %7, 1
  call void @usersAndOperandsLogger(ptr @8, ptr @2)
  %13 = icmp eq i64 %12, 1024
  call void @usersAndOperandsLogger(ptr @3, ptr @8)
  br i1 %13, label %10, label %6, !llvm.loop !5

14:                                               ; preds = %6, %33
  %15 = phi i64 [ 0, %6 ], [ %35, %33 ]
  %16 = phi i32 [ %8, %6 ], [ %34, %33 ]
  call void @usersAndOperandsLogger(ptr @12, ptr @2)
  call void @usersAndOperandsLogger(ptr @12, ptr @2)
  %17 = getelementptr inbounds [512 x i32], ptr %2, i64 %7, i64 %15
  call void @usersAndOperandsLogger(ptr @9, ptr @12)
  %18 = load i32, ptr %17, align 4, !tbaa !7
  call void @usersAndOperandsLogger(ptr @12, ptr @2)
  call void @usersAndOperandsLogger(ptr @12, ptr @2)
  %19 = getelementptr inbounds [512 x i32], ptr %1, i64 %7, i64 %15
  call void @usersAndOperandsLogger(ptr @9, ptr @12)
  %20 = load i32, ptr %19, align 4, !tbaa !7
  call void @usersAndOperandsLogger(ptr @8, ptr @9)
  call void @usersAndOperandsLogger(ptr @8, ptr @9)
  %21 = icmp eq i32 %18, %20
  call void @usersAndOperandsLogger(ptr @3, ptr @8)
  br i1 %21, label %33, label %22

22:                                               ; preds = %14
  call void @usersAndOperandsLogger(ptr @8, ptr @9)
  %23 = icmp ne i32 %18, %0
  call void @usersAndOperandsLogger(ptr @8, ptr @2)
  call void @usersAndOperandsLogger(ptr @8, ptr @2)
  %24 = icmp sgt i32 %16, 6199
  call void @usersAndOperandsLogger(ptr @11, ptr @8)
  call void @usersAndOperandsLogger(ptr @11, ptr @8)
  %25 = select i1 %23, i1 true, i1 %24
  call void @usersAndOperandsLogger(ptr @3, ptr @11)
  br i1 %25, label %33, label %26

26:                                               ; preds = %22
  call void @usersAndOperandsLogger(ptr @7, ptr @2)
  call void @usersAndOperandsLogger(ptr @7, ptr @2)
  %27 = sext i32 %16 to i64
  call void @usersAndOperandsLogger(ptr @12, ptr @7)
  %28 = getelementptr inbounds i32, ptr %3, i64 %27
  call void @usersAndOperandsLogger(ptr @10, ptr @1)
  call void @usersAndOperandsLogger(ptr @10, ptr @12)
  store i32 %9, ptr %28, align 4, !tbaa !7
  call void @usersAndOperandsLogger(ptr @12, ptr @7)
  %29 = getelementptr inbounds i32, ptr %4, i64 %27
  call void @usersAndOperandsLogger(ptr @1, ptr @2)
  %30 = trunc i64 %15 to i32
  call void @usersAndOperandsLogger(ptr @10, ptr @1)
  call void @usersAndOperandsLogger(ptr @10, ptr @12)
  store i32 %30, ptr %29, align 4, !tbaa !7
  call void @usersAndOperandsLogger(ptr @2, ptr @2)
  call void @usersAndOperandsLogger(ptr @2, ptr @2)
  %31 = add nsw i32 %16, 1
  call void @usersAndOperandsLogger(ptr @9, ptr @12)
  %32 = load i32, ptr %17, align 4, !tbaa !7
  call void @usersAndOperandsLogger(ptr @10, ptr @9)
  call void @usersAndOperandsLogger(ptr @10, ptr @12)
  store i32 %32, ptr %19, align 4, !tbaa !7
  br label %33

33:                                               ; preds = %14, %22, %26
  %34 = phi i32 [ %16, %22 ], [ %31, %26 ], [ %16, %14 ]
  call void @usersAndOperandsLogger(ptr @2, ptr @2)
  %35 = add nuw nsw i64 %15, 1
  call void @usersAndOperandsLogger(ptr @8, ptr @2)
  %36 = icmp eq i64 %35, 512
  call void @usersAndOperandsLogger(ptr @3, ptr @8)
  br i1 %36, label %11, label %14, !llvm.loop !11
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

declare void @simPutPixels(ptr noundef, ptr noundef, i32 noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: nounwind uwtable
define dso_local void @app() local_unnamed_addr #0 {
  %1 = alloca [1024 x [512 x i32]], align 16
  %2 = alloca [1024 x [512 x i32]], align 16
  %3 = alloca [6200 x i32], align 16
  %4 = alloca [6200 x i32], align 16
  call void @usersAndOperandsLogger(ptr @4, ptr @6)
  call void @llvm.lifetime.start.p0(i64 2097152, ptr nonnull %1) #5
  call void @usersAndOperandsLogger(ptr @4, ptr @6)
  call void @llvm.lifetime.start.p0(i64 2097152, ptr nonnull %2) #5
  call void @usersAndOperandsLogger(ptr @4, ptr @6)
  call void @llvm.lifetime.start.p0(i64 24800, ptr nonnull %3) #5
  call void @usersAndOperandsLogger(ptr @4, ptr @6)
  call void @llvm.lifetime.start.p0(i64 24800, ptr nonnull %4) #5
  call void @usersAndOperandsLogger(ptr @4, ptr @6)
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(2097152) %1, i8 0, i64 2097152, i1 false), !tbaa !7
  call void @usersAndOperandsLogger(ptr @4, ptr @6)
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(2097152) %2, i8 0, i64 2097152, i1 false), !tbaa !7
  br label %5

5:                                                ; preds = %0, %180
  %6 = phi i32 [ %181, %180 ], [ 0, %0 ]
  br label %8

7:                                                ; preds = %180
  call void @usersAndOperandsLogger(ptr @4, ptr @6)
  call void @llvm.lifetime.end.p0(i64 24800, ptr nonnull %4) #5
  call void @usersAndOperandsLogger(ptr @4, ptr @6)
  call void @llvm.lifetime.end.p0(i64 24800, ptr nonnull %3) #5
  call void @usersAndOperandsLogger(ptr @4, ptr @6)
  call void @llvm.lifetime.end.p0(i64 2097152, ptr nonnull %2) #5
  call void @usersAndOperandsLogger(ptr @4, ptr @6)
  call void @llvm.lifetime.end.p0(i64 2097152, ptr nonnull %1) #5
  ret void

8:                                                ; preds = %5, %11
  %9 = phi i64 [ 0, %5 ], [ %12, %11 ]
  %10 = phi i32 [ 0, %5 ], [ %28, %11 ]
  br label %14

11:                                               ; preds = %27
  call void @usersAndOperandsLogger(ptr @2, ptr @2)
  %12 = add nuw nsw i64 %9, 1
  call void @usersAndOperandsLogger(ptr @8, ptr @2)
  %13 = icmp eq i64 %12, 1024
  call void @usersAndOperandsLogger(ptr @3, ptr @8)
  br i1 %13, label %35, label %8, !llvm.loop !12

14:                                               ; preds = %8, %27
  %15 = phi i64 [ 510, %8 ], [ %29, %27 ]
  %16 = phi i32 [ %10, %8 ], [ %28, %27 ]
  call void @usersAndOperandsLogger(ptr @12, ptr @6)
  call void @usersAndOperandsLogger(ptr @12, ptr @2)
  call void @usersAndOperandsLogger(ptr @12, ptr @2)
  %17 = getelementptr inbounds [1024 x [512 x i32]], ptr %2, i64 0, i64 %9, i64 %15
  call void @usersAndOperandsLogger(ptr @9, ptr @12)
  %18 = load i32, ptr %17, align 4, !tbaa !7
  call void @usersAndOperandsLogger(ptr @8, ptr @9)
  %19 = icmp eq i32 %18, 0
  call void @usersAndOperandsLogger(ptr @3, ptr @8)
  br i1 %19, label %27, label %20

20:                                               ; preds = %14
  call void @usersAndOperandsLogger(ptr @2, ptr @2)
  %21 = add nuw nsw i64 %15, 1
  call void @usersAndOperandsLogger(ptr @12, ptr @6)
  call void @usersAndOperandsLogger(ptr @12, ptr @2)
  call void @usersAndOperandsLogger(ptr @12, ptr @2)
  %22 = getelementptr inbounds [1024 x [512 x i32]], ptr %2, i64 0, i64 %9, i64 %21
  call void @usersAndOperandsLogger(ptr @9, ptr @12)
  %23 = load i32, ptr %22, align 4, !tbaa !7
  call void @usersAndOperandsLogger(ptr @8, ptr @9)
  %24 = icmp eq i32 %23, 0
  call void @usersAndOperandsLogger(ptr @3, ptr @8)
  br i1 %24, label %25, label %27

25:                                               ; preds = %20
  call void @usersAndOperandsLogger(ptr @10, ptr @12)
  store i32 0, ptr %17, align 4, !tbaa !7
  call void @usersAndOperandsLogger(ptr @10, ptr @12)
  store i32 16777215, ptr %22, align 4, !tbaa !7
  call void @usersAndOperandsLogger(ptr @2, ptr @2)
  call void @usersAndOperandsLogger(ptr @2, ptr @2)
  %26 = add nsw i32 %16, 1
  br label %27

27:                                               ; preds = %14, %20, %25
  %28 = phi i32 [ %26, %25 ], [ %16, %20 ], [ %16, %14 ]
  call void @usersAndOperandsLogger(ptr @2, ptr @2)
  %29 = add nsw i64 %15, -1
  call void @usersAndOperandsLogger(ptr @8, ptr @2)
  %30 = icmp eq i64 %15, 0
  call void @usersAndOperandsLogger(ptr @3, ptr @8)
  br i1 %30, label %11, label %14, !llvm.loop !13

31:                                               ; preds = %93
  call void @usersAndOperandsLogger(ptr @8, ptr @4)
  call void @usersAndOperandsLogger(ptr @8, ptr @4)
  %32 = icmp sgt i32 %94, 0
  call void @usersAndOperandsLogger(ptr @3, ptr @8)
  br i1 %32, label %33, label %96

33:                                               ; preds = %31
  call void @usersAndOperandsLogger(ptr @0, ptr @4)
  call void @usersAndOperandsLogger(ptr @0, ptr @4)
  %34 = zext nneg i32 %94 to i64
  br label %98

35:                                               ; preds = %11, %93
  %36 = phi i64 [ %41, %93 ], [ 0, %11 ]
  %37 = phi i32 [ %94, %93 ], [ 510, %11 ]
  call void @usersAndOperandsLogger(ptr @8, ptr @2)
  %38 = icmp eq i64 %36, 0
  call void @usersAndOperandsLogger(ptr @2, ptr @2)
  %39 = add nsw i64 %36, -1
  call void @usersAndOperandsLogger(ptr @8, ptr @2)
  %40 = icmp eq i64 %36, 1023
  call void @usersAndOperandsLogger(ptr @2, ptr @2)
  %41 = add nuw nsw i64 %36, 1
  br label %42

42:                                               ; preds = %35, %82
  %43 = phi i32 [ 510, %35 ], [ %85, %82 ]
  %44 = phi i32 [ 0, %35 ], [ %83, %82 ]
  %45 = phi i32 [ 0, %35 ], [ %84, %82 ]
  %46 = phi i32 [ %37, %35 ], [ %52, %82 ]
  call void @usersAndOperandsLogger(ptr @0, ptr @2)
  %47 = zext nneg i32 %43 to i64
  call void @usersAndOperandsLogger(ptr @12, ptr @6)
  call void @usersAndOperandsLogger(ptr @12, ptr @0)
  call void @usersAndOperandsLogger(ptr @12, ptr @2)
  %48 = getelementptr inbounds [1024 x [512 x i32]], ptr %2, i64 0, i64 %36, i64 %47
  call void @usersAndOperandsLogger(ptr @9, ptr @12)
  %49 = load i32, ptr %48, align 4, !tbaa !7
  call void @usersAndOperandsLogger(ptr @8, ptr @9)
  %50 = icmp eq i32 %49, 0
  call void @usersAndOperandsLogger(ptr @3, ptr @8)
  br i1 %50, label %93, label %51

51:                                               ; preds = %42
  call void @usersAndOperandsLogger(ptr @4, ptr @4)
  call void @usersAndOperandsLogger(ptr @4, ptr @2)
  %52 = call i32 @llvm.smin.i32(i32 %46, i32 %43)
  call void @usersAndOperandsLogger(ptr @3, ptr @8)
  br i1 %38, label %61, label %53

53:                                               ; preds = %51
  call void @usersAndOperandsLogger(ptr @12, ptr @6)
  call void @usersAndOperandsLogger(ptr @12, ptr @2)
  call void @usersAndOperandsLogger(ptr @12, ptr @0)
  %54 = getelementptr inbounds [1024 x [512 x i32]], ptr %2, i64 0, i64 %39, i64 %47
  call void @usersAndOperandsLogger(ptr @9, ptr @12)
  %55 = load i32, ptr %54, align 4, !tbaa !7
  call void @usersAndOperandsLogger(ptr @8, ptr @9)
  %56 = icmp eq i32 %55, 0
  call void @usersAndOperandsLogger(ptr @2, ptr @11)
  call void @usersAndOperandsLogger(ptr @2, ptr @11)
  %57 = add nsw i32 %45, 1
  call void @usersAndOperandsLogger(ptr @11, ptr @8)
  call void @usersAndOperandsLogger(ptr @11, ptr @2)
  %58 = select i1 %56, i32 %57, i32 0
  call void @usersAndOperandsLogger(ptr @3, ptr @8)
  br i1 %40, label %59, label %61

59:                                               ; preds = %53
  call void @usersAndOperandsLogger(ptr @8, ptr @11)
  %60 = icmp eq i32 %58, 3
  call void @usersAndOperandsLogger(ptr @3, ptr @8)
  br i1 %60, label %79, label %82

61:                                               ; preds = %51, %53
  %62 = phi i32 [ %58, %53 ], [ 0, %51 ]
  call void @usersAndOperandsLogger(ptr @12, ptr @6)
  call void @usersAndOperandsLogger(ptr @12, ptr @2)
  call void @usersAndOperandsLogger(ptr @12, ptr @0)
  %63 = getelementptr inbounds [1024 x [512 x i32]], ptr %2, i64 0, i64 %41, i64 %47
  call void @usersAndOperandsLogger(ptr @9, ptr @12)
  %64 = load i32, ptr %63, align 4, !tbaa !7
  call void @usersAndOperandsLogger(ptr @8, ptr @9)
  %65 = icmp eq i32 %64, 0
  call void @usersAndOperandsLogger(ptr @2, ptr @11)
  %66 = add nsw i32 %44, 1
  call void @usersAndOperandsLogger(ptr @11, ptr @8)
  call void @usersAndOperandsLogger(ptr @11, ptr @2)
  %67 = select i1 %65, i32 %66, i32 0
  call void @usersAndOperandsLogger(ptr @8, ptr @11)
  %68 = icmp eq i32 %62, 3
  call void @usersAndOperandsLogger(ptr @8, ptr @11)
  %69 = icmp eq i32 %67, 3
  call void @usersAndOperandsLogger(ptr @11, ptr @8)
  call void @usersAndOperandsLogger(ptr @11, ptr @8)
  %70 = select i1 %68, i1 %69, i1 false
  call void @usersAndOperandsLogger(ptr @3, ptr @11)
  br i1 %70, label %71, label %78

71:                                               ; preds = %61
  call void @usersAndOperandsLogger(ptr @10, ptr @12)
  store i32 0, ptr %48, align 4, !tbaa !7
  call void @usersAndOperandsLogger(ptr @2, ptr @2)
  %72 = add nuw nsw i32 %43, 1
  call void @usersAndOperandsLogger(ptr @0, ptr @2)
  %73 = zext nneg i32 %72 to i64
  call void @usersAndOperandsLogger(ptr @12, ptr @6)
  call void @usersAndOperandsLogger(ptr @12, ptr @0)
  call void @usersAndOperandsLogger(ptr @12, ptr @2)
  %74 = getelementptr inbounds [1024 x [512 x i32]], ptr %2, i64 0, i64 %36, i64 %73
  call void @usersAndOperandsLogger(ptr @10, ptr @12)
  store i32 0, ptr %74, align 4, !tbaa !7
  call void @usersAndOperandsLogger(ptr @2, ptr @2)
  %75 = add nuw nsw i32 %43, 2
  call void @usersAndOperandsLogger(ptr @0, ptr @2)
  %76 = zext nneg i32 %75 to i64
  call void @usersAndOperandsLogger(ptr @12, ptr @6)
  call void @usersAndOperandsLogger(ptr @12, ptr @2)
  call void @usersAndOperandsLogger(ptr @12, ptr @0)
  %77 = getelementptr inbounds [1024 x [512 x i32]], ptr %2, i64 0, i64 %39, i64 %76
  call void @usersAndOperandsLogger(ptr @10, ptr @12)
  store i32 16777215, ptr %77, align 4, !tbaa !7
  br label %87

78:                                               ; preds = %61
  call void @usersAndOperandsLogger(ptr @3, ptr @8)
  br i1 %68, label %79, label %80

79:                                               ; preds = %59, %78
  call void @usersAndOperandsLogger(ptr @10, ptr @12)
  store i32 0, ptr %48, align 4, !tbaa !7
  br label %87

80:                                               ; preds = %78
  call void @usersAndOperandsLogger(ptr @3, ptr @8)
  br i1 %69, label %81, label %82

81:                                               ; preds = %80
  call void @usersAndOperandsLogger(ptr @10, ptr @12)
  store i32 0, ptr %48, align 4, !tbaa !7
  br label %87

82:                                               ; preds = %59, %80
  %83 = phi i32 [ %67, %80 ], [ 0, %59 ]
  %84 = phi i32 [ %62, %80 ], [ %58, %59 ]
  call void @usersAndOperandsLogger(ptr @2, ptr @2)
  %85 = add nsw i32 %43, -1
  call void @usersAndOperandsLogger(ptr @8, ptr @2)
  %86 = icmp eq i32 %43, 0
  call void @usersAndOperandsLogger(ptr @3, ptr @8)
  br i1 %86, label %93, label %42, !llvm.loop !14

87:                                               ; preds = %71, %79, %81
  %88 = phi i32 [ -2, %71 ], [ -1, %79 ], [ -1, %81 ]
  %89 = phi i64 [ %41, %71 ], [ %39, %79 ], [ %41, %81 ]
  call void @usersAndOperandsLogger(ptr @2, ptr @2)
  %90 = add nsw i32 %43, %88
  call void @usersAndOperandsLogger(ptr @7, ptr @2)
  %91 = sext i32 %90 to i64
  call void @usersAndOperandsLogger(ptr @12, ptr @6)
  call void @usersAndOperandsLogger(ptr @12, ptr @7)
  call void @usersAndOperandsLogger(ptr @12, ptr @2)
  call void @usersAndOperandsLogger(ptr @12, ptr @2)
  call void @usersAndOperandsLogger(ptr @12, ptr @2)
  %92 = getelementptr inbounds [1024 x [512 x i32]], ptr %2, i64 0, i64 %89, i64 %91
  call void @usersAndOperandsLogger(ptr @10, ptr @12)
  store i32 16777215, ptr %92, align 4, !tbaa !7
  br label %93

93:                                               ; preds = %42, %82, %87
  %94 = phi i32 [ %52, %87 ], [ %52, %82 ], [ %46, %42 ]
  call void @usersAndOperandsLogger(ptr @8, ptr @2)
  %95 = icmp eq i64 %41, 1024
  call void @usersAndOperandsLogger(ptr @3, ptr @8)
  br i1 %95, label %31, label %35, !llvm.loop !15

96:                                               ; preds = %102, %31
  call void @usersAndOperandsLogger(ptr @8, ptr @2)
  %97 = icmp slt i32 %28, 5000
  call void @usersAndOperandsLogger(ptr @3, ptr @8)
  br i1 %97, label %183, label %247

98:                                               ; preds = %33, %102
  %99 = phi i64 [ 0, %33 ], [ %104, %102 ]
  call void @usersAndOperandsLogger(ptr @12, ptr @6)
  call void @usersAndOperandsLogger(ptr @12, ptr @2)
  %100 = getelementptr inbounds [512 x i32], ptr %2, i64 0, i64 %99
  call void @usersAndOperandsLogger(ptr @9, ptr @12)
  %101 = load i32, ptr %100, align 4, !tbaa !7
  br label %106

102:                                              ; preds = %106
  call void @usersAndOperandsLogger(ptr @12, ptr @6)
  call void @usersAndOperandsLogger(ptr @12, ptr @2)
  %103 = getelementptr inbounds [1024 x [512 x i32]], ptr %2, i64 0, i64 1023, i64 %99
  call void @usersAndOperandsLogger(ptr @10, ptr @9)
  call void @usersAndOperandsLogger(ptr @10, ptr @12)
  store i32 %101, ptr %103, align 4, !tbaa !7
  call void @usersAndOperandsLogger(ptr @2, ptr @2)
  %104 = add nuw nsw i64 %99, 1
  call void @usersAndOperandsLogger(ptr @8, ptr @2)
  call void @usersAndOperandsLogger(ptr @8, ptr @0)
  %105 = icmp eq i64 %104, %34
  call void @usersAndOperandsLogger(ptr @3, ptr @8)
  br i1 %105, label %96, label %98, !llvm.loop !16

106:                                              ; preds = %106, %98
  %107 = phi i64 [ 0, %98 ], [ %116, %106 ]
  call void @usersAndOperandsLogger(ptr @2, ptr @2)
  %108 = add nuw nsw i64 %107, 1
  call void @usersAndOperandsLogger(ptr @12, ptr @6)
  call void @usersAndOperandsLogger(ptr @12, ptr @2)
  call void @usersAndOperandsLogger(ptr @12, ptr @2)
  %109 = getelementptr inbounds [1024 x [512 x i32]], ptr %2, i64 0, i64 %108, i64 %99
  call void @usersAndOperandsLogger(ptr @9, ptr @12)
  %110 = load i32, ptr %109, align 4, !tbaa !7
  call void @usersAndOperandsLogger(ptr @12, ptr @6)
  call void @usersAndOperandsLogger(ptr @12, ptr @2)
  call void @usersAndOperandsLogger(ptr @12, ptr @2)
  %111 = getelementptr inbounds [1024 x [512 x i32]], ptr %2, i64 0, i64 %107, i64 %99
  call void @usersAndOperandsLogger(ptr @10, ptr @9)
  call void @usersAndOperandsLogger(ptr @10, ptr @12)
  store i32 %110, ptr %111, align 4, !tbaa !7
  call void @usersAndOperandsLogger(ptr @2, ptr @2)
  %112 = add nuw nsw i64 %107, 2
  call void @usersAndOperandsLogger(ptr @12, ptr @6)
  call void @usersAndOperandsLogger(ptr @12, ptr @2)
  call void @usersAndOperandsLogger(ptr @12, ptr @2)
  %113 = getelementptr inbounds [1024 x [512 x i32]], ptr %2, i64 0, i64 %112, i64 %99
  call void @usersAndOperandsLogger(ptr @9, ptr @12)
  %114 = load i32, ptr %113, align 4, !tbaa !7
  call void @usersAndOperandsLogger(ptr @12, ptr @6)
  call void @usersAndOperandsLogger(ptr @12, ptr @2)
  call void @usersAndOperandsLogger(ptr @12, ptr @2)
  %115 = getelementptr inbounds [1024 x [512 x i32]], ptr %2, i64 0, i64 %108, i64 %99
  call void @usersAndOperandsLogger(ptr @10, ptr @9)
  call void @usersAndOperandsLogger(ptr @10, ptr @12)
  store i32 %114, ptr %115, align 4, !tbaa !7
  call void @usersAndOperandsLogger(ptr @2, ptr @2)
  %116 = add nuw nsw i64 %107, 3
  call void @usersAndOperandsLogger(ptr @12, ptr @6)
  call void @usersAndOperandsLogger(ptr @12, ptr @2)
  call void @usersAndOperandsLogger(ptr @12, ptr @2)
  %117 = getelementptr inbounds [1024 x [512 x i32]], ptr %2, i64 0, i64 %116, i64 %99
  call void @usersAndOperandsLogger(ptr @9, ptr @12)
  %118 = load i32, ptr %117, align 4, !tbaa !7
  call void @usersAndOperandsLogger(ptr @12, ptr @6)
  call void @usersAndOperandsLogger(ptr @12, ptr @2)
  call void @usersAndOperandsLogger(ptr @12, ptr @2)
  %119 = getelementptr inbounds [1024 x [512 x i32]], ptr %2, i64 0, i64 %112, i64 %99
  call void @usersAndOperandsLogger(ptr @10, ptr @9)
  call void @usersAndOperandsLogger(ptr @10, ptr @12)
  store i32 %118, ptr %119, align 4, !tbaa !7
  call void @usersAndOperandsLogger(ptr @8, ptr @2)
  %120 = icmp eq i64 %116, 1023
  call void @usersAndOperandsLogger(ptr @3, ptr @8)
  br i1 %120, label %102, label %106, !llvm.loop !17

121:                                              ; preds = %247, %125
  %122 = phi i64 [ %126, %125 ], [ 0, %247 ]
  %123 = phi i32 [ %147, %125 ], [ 0, %247 ]
  call void @usersAndOperandsLogger(ptr @1, ptr @2)
  %124 = trunc i64 %122 to i32
  br label %128

125:                                              ; preds = %146
  call void @usersAndOperandsLogger(ptr @2, ptr @2)
  %126 = add nuw nsw i64 %122, 1
  call void @usersAndOperandsLogger(ptr @8, ptr @2)
  %127 = icmp eq i64 %126, 1024
  call void @usersAndOperandsLogger(ptr @3, ptr @8)
  br i1 %127, label %150, label %121, !llvm.loop !5

128:                                              ; preds = %146, %121
  %129 = phi i64 [ 0, %121 ], [ %148, %146 ]
  %130 = phi i32 [ %123, %121 ], [ %147, %146 ]
  call void @usersAndOperandsLogger(ptr @12, ptr @6)
  call void @usersAndOperandsLogger(ptr @12, ptr @2)
  call void @usersAndOperandsLogger(ptr @12, ptr @2)
  %131 = getelementptr inbounds [512 x i32], ptr %2, i64 %122, i64 %129
  call void @usersAndOperandsLogger(ptr @9, ptr @12)
  %132 = load i32, ptr %131, align 4, !tbaa !7
  call void @usersAndOperandsLogger(ptr @12, ptr @6)
  call void @usersAndOperandsLogger(ptr @12, ptr @2)
  call void @usersAndOperandsLogger(ptr @12, ptr @2)
  %133 = getelementptr inbounds [512 x i32], ptr %1, i64 %122, i64 %129
  call void @usersAndOperandsLogger(ptr @9, ptr @12)
  %134 = load i32, ptr %133, align 4, !tbaa !7
  call void @usersAndOperandsLogger(ptr @8, ptr @9)
  call void @usersAndOperandsLogger(ptr @8, ptr @9)
  %135 = icmp eq i32 %132, %134
  call void @usersAndOperandsLogger(ptr @3, ptr @8)
  br i1 %135, label %146, label %136

136:                                              ; preds = %128
  call void @usersAndOperandsLogger(ptr @8, ptr @9)
  %137 = icmp ne i32 %132, 0
  call void @usersAndOperandsLogger(ptr @8, ptr @2)
  call void @usersAndOperandsLogger(ptr @8, ptr @2)
  %138 = icmp sgt i32 %130, 6199
  call void @usersAndOperandsLogger(ptr @11, ptr @8)
  call void @usersAndOperandsLogger(ptr @11, ptr @8)
  %139 = select i1 %137, i1 true, i1 %138
  call void @usersAndOperandsLogger(ptr @3, ptr @11)
  br i1 %139, label %146, label %140

140:                                              ; preds = %136
  call void @usersAndOperandsLogger(ptr @7, ptr @2)
  call void @usersAndOperandsLogger(ptr @7, ptr @2)
  %141 = sext i32 %130 to i64
  call void @usersAndOperandsLogger(ptr @12, ptr @6)
  call void @usersAndOperandsLogger(ptr @12, ptr @7)
  %142 = getelementptr inbounds i32, ptr %3, i64 %141
  call void @usersAndOperandsLogger(ptr @10, ptr @1)
  call void @usersAndOperandsLogger(ptr @10, ptr @12)
  store i32 %124, ptr %142, align 4, !tbaa !7
  call void @usersAndOperandsLogger(ptr @12, ptr @6)
  call void @usersAndOperandsLogger(ptr @12, ptr @7)
  %143 = getelementptr inbounds i32, ptr %4, i64 %141
  call void @usersAndOperandsLogger(ptr @1, ptr @2)
  %144 = trunc i64 %129 to i32
  call void @usersAndOperandsLogger(ptr @10, ptr @1)
  call void @usersAndOperandsLogger(ptr @10, ptr @12)
  store i32 %144, ptr %143, align 4, !tbaa !7
  call void @usersAndOperandsLogger(ptr @2, ptr @2)
  call void @usersAndOperandsLogger(ptr @2, ptr @2)
  %145 = add nsw i32 %130, 1
  call void @usersAndOperandsLogger(ptr @10, ptr @12)
  store i32 0, ptr %133, align 4, !tbaa !7
  br label %146

146:                                              ; preds = %140, %136, %128
  %147 = phi i32 [ %130, %136 ], [ %145, %140 ], [ %130, %128 ]
  call void @usersAndOperandsLogger(ptr @2, ptr @2)
  %148 = add nuw nsw i64 %129, 1
  call void @usersAndOperandsLogger(ptr @8, ptr @2)
  %149 = icmp eq i64 %148, 512
  call void @usersAndOperandsLogger(ptr @3, ptr @8)
  br i1 %149, label %125, label %128, !llvm.loop !11

150:                                              ; preds = %125
  call void @usersAndOperandsLogger(ptr @4, ptr @6)
  call void @usersAndOperandsLogger(ptr @4, ptr @6)
  call void @usersAndOperandsLogger(ptr @4, ptr @2)
  call void @simPutPixels(ptr noundef nonnull %3, ptr noundef nonnull %4, i32 noundef 0, i32 noundef %147) #5
  br label %151

151:                                              ; preds = %155, %150
  %152 = phi i64 [ 0, %150 ], [ %156, %155 ]
  %153 = phi i32 [ 0, %150 ], [ %177, %155 ]
  call void @usersAndOperandsLogger(ptr @1, ptr @2)
  %154 = trunc i64 %152 to i32
  br label %158

155:                                              ; preds = %176
  call void @usersAndOperandsLogger(ptr @2, ptr @2)
  %156 = add nuw nsw i64 %152, 1
  call void @usersAndOperandsLogger(ptr @8, ptr @2)
  %157 = icmp eq i64 %156, 1024
  call void @usersAndOperandsLogger(ptr @3, ptr @8)
  br i1 %157, label %180, label %151, !llvm.loop !5

158:                                              ; preds = %176, %151
  %159 = phi i64 [ 0, %151 ], [ %178, %176 ]
  %160 = phi i32 [ %153, %151 ], [ %177, %176 ]
  call void @usersAndOperandsLogger(ptr @12, ptr @6)
  call void @usersAndOperandsLogger(ptr @12, ptr @2)
  call void @usersAndOperandsLogger(ptr @12, ptr @2)
  %161 = getelementptr inbounds [512 x i32], ptr %2, i64 %152, i64 %159
  call void @usersAndOperandsLogger(ptr @9, ptr @12)
  %162 = load i32, ptr %161, align 4, !tbaa !7
  call void @usersAndOperandsLogger(ptr @12, ptr @6)
  call void @usersAndOperandsLogger(ptr @12, ptr @2)
  call void @usersAndOperandsLogger(ptr @12, ptr @2)
  %163 = getelementptr inbounds [512 x i32], ptr %1, i64 %152, i64 %159
  call void @usersAndOperandsLogger(ptr @9, ptr @12)
  %164 = load i32, ptr %163, align 4, !tbaa !7
  call void @usersAndOperandsLogger(ptr @8, ptr @9)
  call void @usersAndOperandsLogger(ptr @8, ptr @9)
  %165 = icmp eq i32 %162, %164
  call void @usersAndOperandsLogger(ptr @3, ptr @8)
  br i1 %165, label %176, label %166

166:                                              ; preds = %158
  call void @usersAndOperandsLogger(ptr @8, ptr @9)
  %167 = icmp ne i32 %162, 16777215
  call void @usersAndOperandsLogger(ptr @8, ptr @2)
  call void @usersAndOperandsLogger(ptr @8, ptr @2)
  %168 = icmp sgt i32 %160, 6199
  call void @usersAndOperandsLogger(ptr @11, ptr @8)
  call void @usersAndOperandsLogger(ptr @11, ptr @8)
  %169 = select i1 %167, i1 true, i1 %168
  call void @usersAndOperandsLogger(ptr @3, ptr @11)
  br i1 %169, label %176, label %170

170:                                              ; preds = %166
  call void @usersAndOperandsLogger(ptr @7, ptr @2)
  call void @usersAndOperandsLogger(ptr @7, ptr @2)
  %171 = sext i32 %160 to i64
  call void @usersAndOperandsLogger(ptr @12, ptr @6)
  call void @usersAndOperandsLogger(ptr @12, ptr @7)
  %172 = getelementptr inbounds i32, ptr %3, i64 %171
  call void @usersAndOperandsLogger(ptr @10, ptr @1)
  call void @usersAndOperandsLogger(ptr @10, ptr @12)
  store i32 %154, ptr %172, align 4, !tbaa !7
  call void @usersAndOperandsLogger(ptr @12, ptr @6)
  call void @usersAndOperandsLogger(ptr @12, ptr @7)
  %173 = getelementptr inbounds i32, ptr %4, i64 %171
  call void @usersAndOperandsLogger(ptr @1, ptr @2)
  %174 = trunc i64 %159 to i32
  call void @usersAndOperandsLogger(ptr @10, ptr @1)
  call void @usersAndOperandsLogger(ptr @10, ptr @12)
  store i32 %174, ptr %173, align 4, !tbaa !7
  call void @usersAndOperandsLogger(ptr @2, ptr @2)
  call void @usersAndOperandsLogger(ptr @2, ptr @2)
  %175 = add nsw i32 %160, 1
  call void @usersAndOperandsLogger(ptr @10, ptr @12)
  store i32 16777215, ptr %163, align 4, !tbaa !7
  br label %176

176:                                              ; preds = %170, %166, %158
  %177 = phi i32 [ %160, %166 ], [ %175, %170 ], [ %160, %158 ]
  call void @usersAndOperandsLogger(ptr @2, ptr @2)
  %178 = add nuw nsw i64 %159, 1
  call void @usersAndOperandsLogger(ptr @8, ptr @2)
  %179 = icmp eq i64 %178, 512
  call void @usersAndOperandsLogger(ptr @3, ptr @8)
  br i1 %179, label %155, label %158, !llvm.loop !11

180:                                              ; preds = %155
  call void @usersAndOperandsLogger(ptr @4, ptr @6)
  call void @usersAndOperandsLogger(ptr @4, ptr @6)
  call void @usersAndOperandsLogger(ptr @4, ptr @2)
  call void @simPutPixels(ptr noundef nonnull %3, ptr noundef nonnull %4, i32 noundef 16777215, i32 noundef %177) #5
  call void (...) @simFlush() #5
  call void @usersAndOperandsLogger(ptr @2, ptr @2)
  %181 = add nuw nsw i32 %6, 1
  call void @usersAndOperandsLogger(ptr @8, ptr @2)
  %182 = icmp eq i32 %181, 1000000000
  call void @usersAndOperandsLogger(ptr @3, ptr @8)
  br i1 %182, label %7, label %5, !llvm.loop !18

183:                                              ; preds = %96
  %184 = call i32 @simRand() #5
  call void @usersAndOperandsLogger(ptr @5, ptr @4)
  %185 = srem i32 %184, 1024
  call void @usersAndOperandsLogger(ptr @7, ptr @5)
  %186 = sext i32 %185 to i64
  call void @usersAndOperandsLogger(ptr @12, ptr @6)
  call void @usersAndOperandsLogger(ptr @12, ptr @7)
  %187 = getelementptr inbounds [1024 x [512 x i32]], ptr %2, i64 0, i64 %186
  call void @usersAndOperandsLogger(ptr @9, ptr @12)
  %188 = load i32, ptr %187, align 16, !tbaa !7
  call void @usersAndOperandsLogger(ptr @8, ptr @9)
  %189 = icmp eq i32 %188, 0
  call void @usersAndOperandsLogger(ptr @3, ptr @8)
  br i1 %189, label %190, label %193

190:                                              ; preds = %183
  call void @usersAndOperandsLogger(ptr @10, ptr @12)
  store i32 16777215, ptr %187, align 16, !tbaa !7
  call void @usersAndOperandsLogger(ptr @2, ptr @2)
  %191 = add nsw i32 %28, 1
  call void @usersAndOperandsLogger(ptr @8, ptr @2)
  %192 = icmp eq i32 %28, 4999
  call void @usersAndOperandsLogger(ptr @3, ptr @8)
  br i1 %192, label %247, label %193

193:                                              ; preds = %183, %190
  %194 = phi i32 [ %191, %190 ], [ %28, %183 ]
  %195 = call i32 @simRand() #5
  call void @usersAndOperandsLogger(ptr @5, ptr @4)
  %196 = srem i32 %195, 1024
  call void @usersAndOperandsLogger(ptr @7, ptr @5)
  %197 = sext i32 %196 to i64
  call void @usersAndOperandsLogger(ptr @12, ptr @6)
  call void @usersAndOperandsLogger(ptr @12, ptr @7)
  %198 = getelementptr inbounds [1024 x [512 x i32]], ptr %2, i64 0, i64 %197
  call void @usersAndOperandsLogger(ptr @9, ptr @12)
  %199 = load i32, ptr %198, align 16, !tbaa !7
  call void @usersAndOperandsLogger(ptr @8, ptr @9)
  %200 = icmp eq i32 %199, 0
  call void @usersAndOperandsLogger(ptr @3, ptr @8)
  br i1 %200, label %201, label %204

201:                                              ; preds = %193
  call void @usersAndOperandsLogger(ptr @10, ptr @12)
  store i32 16777215, ptr %198, align 16, !tbaa !7
  call void @usersAndOperandsLogger(ptr @2, ptr @2)
  call void @usersAndOperandsLogger(ptr @2, ptr @2)
  %202 = add nsw i32 %194, 1
  call void @usersAndOperandsLogger(ptr @8, ptr @2)
  call void @usersAndOperandsLogger(ptr @8, ptr @2)
  %203 = icmp slt i32 %194, 4999
  call void @usersAndOperandsLogger(ptr @3, ptr @8)
  br i1 %203, label %204, label %247

204:                                              ; preds = %193, %201
  %205 = phi i32 [ %202, %201 ], [ %194, %193 ]
  %206 = call i32 @simRand() #5
  call void @usersAndOperandsLogger(ptr @5, ptr @4)
  %207 = srem i32 %206, 1024
  call void @usersAndOperandsLogger(ptr @7, ptr @5)
  %208 = sext i32 %207 to i64
  call void @usersAndOperandsLogger(ptr @12, ptr @6)
  call void @usersAndOperandsLogger(ptr @12, ptr @7)
  %209 = getelementptr inbounds [1024 x [512 x i32]], ptr %2, i64 0, i64 %208
  call void @usersAndOperandsLogger(ptr @9, ptr @12)
  %210 = load i32, ptr %209, align 16, !tbaa !7
  call void @usersAndOperandsLogger(ptr @8, ptr @9)
  %211 = icmp eq i32 %210, 0
  call void @usersAndOperandsLogger(ptr @3, ptr @8)
  br i1 %211, label %212, label %215

212:                                              ; preds = %204
  call void @usersAndOperandsLogger(ptr @10, ptr @12)
  store i32 16777215, ptr %209, align 16, !tbaa !7
  call void @usersAndOperandsLogger(ptr @2, ptr @2)
  call void @usersAndOperandsLogger(ptr @2, ptr @2)
  call void @usersAndOperandsLogger(ptr @2, ptr @2)
  %213 = add nsw i32 %205, 1
  call void @usersAndOperandsLogger(ptr @8, ptr @2)
  call void @usersAndOperandsLogger(ptr @8, ptr @2)
  call void @usersAndOperandsLogger(ptr @8, ptr @2)
  %214 = icmp slt i32 %205, 4999
  call void @usersAndOperandsLogger(ptr @3, ptr @8)
  br i1 %214, label %215, label %247

215:                                              ; preds = %204, %212
  %216 = phi i32 [ %213, %212 ], [ %205, %204 ]
  %217 = call i32 @simRand() #5
  call void @usersAndOperandsLogger(ptr @5, ptr @4)
  %218 = srem i32 %217, 1024
  call void @usersAndOperandsLogger(ptr @7, ptr @5)
  %219 = sext i32 %218 to i64
  call void @usersAndOperandsLogger(ptr @12, ptr @6)
  call void @usersAndOperandsLogger(ptr @12, ptr @7)
  %220 = getelementptr inbounds [1024 x [512 x i32]], ptr %2, i64 0, i64 %219
  call void @usersAndOperandsLogger(ptr @9, ptr @12)
  %221 = load i32, ptr %220, align 16, !tbaa !7
  call void @usersAndOperandsLogger(ptr @8, ptr @9)
  %222 = icmp eq i32 %221, 0
  call void @usersAndOperandsLogger(ptr @3, ptr @8)
  br i1 %222, label %223, label %226

223:                                              ; preds = %215
  call void @usersAndOperandsLogger(ptr @10, ptr @12)
  store i32 16777215, ptr %220, align 16, !tbaa !7
  call void @usersAndOperandsLogger(ptr @2, ptr @2)
  call void @usersAndOperandsLogger(ptr @2, ptr @2)
  call void @usersAndOperandsLogger(ptr @2, ptr @2)
  call void @usersAndOperandsLogger(ptr @2, ptr @2)
  %224 = add nsw i32 %216, 1
  call void @usersAndOperandsLogger(ptr @8, ptr @2)
  call void @usersAndOperandsLogger(ptr @8, ptr @2)
  call void @usersAndOperandsLogger(ptr @8, ptr @2)
  call void @usersAndOperandsLogger(ptr @8, ptr @2)
  %225 = icmp slt i32 %216, 4999
  call void @usersAndOperandsLogger(ptr @3, ptr @8)
  br i1 %225, label %226, label %247

226:                                              ; preds = %215, %223
  %227 = phi i32 [ %224, %223 ], [ %216, %215 ]
  %228 = call i32 @simRand() #5
  call void @usersAndOperandsLogger(ptr @5, ptr @4)
  %229 = srem i32 %228, 1024
  call void @usersAndOperandsLogger(ptr @7, ptr @5)
  %230 = sext i32 %229 to i64
  call void @usersAndOperandsLogger(ptr @12, ptr @6)
  call void @usersAndOperandsLogger(ptr @12, ptr @7)
  %231 = getelementptr inbounds [1024 x [512 x i32]], ptr %2, i64 0, i64 %230
  call void @usersAndOperandsLogger(ptr @9, ptr @12)
  %232 = load i32, ptr %231, align 16, !tbaa !7
  call void @usersAndOperandsLogger(ptr @8, ptr @9)
  %233 = icmp eq i32 %232, 0
  call void @usersAndOperandsLogger(ptr @3, ptr @8)
  br i1 %233, label %234, label %237

234:                                              ; preds = %226
  call void @usersAndOperandsLogger(ptr @10, ptr @12)
  store i32 16777215, ptr %231, align 16, !tbaa !7
  call void @usersAndOperandsLogger(ptr @2, ptr @2)
  call void @usersAndOperandsLogger(ptr @2, ptr @2)
  call void @usersAndOperandsLogger(ptr @2, ptr @2)
  call void @usersAndOperandsLogger(ptr @2, ptr @2)
  call void @usersAndOperandsLogger(ptr @2, ptr @2)
  %235 = add nsw i32 %227, 1
  call void @usersAndOperandsLogger(ptr @8, ptr @2)
  call void @usersAndOperandsLogger(ptr @8, ptr @2)
  call void @usersAndOperandsLogger(ptr @8, ptr @2)
  call void @usersAndOperandsLogger(ptr @8, ptr @2)
  call void @usersAndOperandsLogger(ptr @8, ptr @2)
  %236 = icmp slt i32 %227, 4999
  call void @usersAndOperandsLogger(ptr @3, ptr @8)
  br i1 %236, label %237, label %247

237:                                              ; preds = %226, %234
  %238 = phi i32 [ %235, %234 ], [ %227, %226 ]
  %239 = call i32 @simRand() #5
  call void @usersAndOperandsLogger(ptr @5, ptr @4)
  %240 = srem i32 %239, 1024
  call void @usersAndOperandsLogger(ptr @7, ptr @5)
  %241 = sext i32 %240 to i64
  call void @usersAndOperandsLogger(ptr @12, ptr @6)
  call void @usersAndOperandsLogger(ptr @12, ptr @7)
  %242 = getelementptr inbounds [1024 x [512 x i32]], ptr %2, i64 0, i64 %241
  call void @usersAndOperandsLogger(ptr @9, ptr @12)
  %243 = load i32, ptr %242, align 16, !tbaa !7
  call void @usersAndOperandsLogger(ptr @8, ptr @9)
  %244 = icmp eq i32 %243, 0
  call void @usersAndOperandsLogger(ptr @3, ptr @8)
  br i1 %244, label %245, label %248

245:                                              ; preds = %237
  call void @usersAndOperandsLogger(ptr @10, ptr @12)
  store i32 16777215, ptr %242, align 16, !tbaa !7
  call void @usersAndOperandsLogger(ptr @8, ptr @2)
  call void @usersAndOperandsLogger(ptr @8, ptr @2)
  call void @usersAndOperandsLogger(ptr @8, ptr @2)
  call void @usersAndOperandsLogger(ptr @8, ptr @2)
  call void @usersAndOperandsLogger(ptr @8, ptr @2)
  call void @usersAndOperandsLogger(ptr @8, ptr @2)
  %246 = icmp slt i32 %238, 4999
  call void @usersAndOperandsLogger(ptr @3, ptr @8)
  br i1 %246, label %248, label %247

247:                                              ; preds = %248, %96, %190, %201, %212, %223, %234, %245
  br label %121

248:                                              ; preds = %237, %245
  %249 = call i32 @simRand() #5
  call void @usersAndOperandsLogger(ptr @5, ptr @4)
  %250 = srem i32 %249, 1024
  call void @usersAndOperandsLogger(ptr @7, ptr @5)
  %251 = sext i32 %250 to i64
  call void @usersAndOperandsLogger(ptr @12, ptr @6)
  call void @usersAndOperandsLogger(ptr @12, ptr @7)
  %252 = getelementptr inbounds [1024 x [512 x i32]], ptr %2, i64 0, i64 %251
  call void @usersAndOperandsLogger(ptr @9, ptr @12)
  %253 = load i32, ptr %252, align 16, !tbaa !7
  call void @usersAndOperandsLogger(ptr @8, ptr @9)
  %254 = icmp eq i32 %253, 0
  call void @usersAndOperandsLogger(ptr @11, ptr @8)
  call void @usersAndOperandsLogger(ptr @11, ptr @9)
  %255 = select i1 %254, i32 16777215, i32 %253
  call void @usersAndOperandsLogger(ptr @10, ptr @11)
  call void @usersAndOperandsLogger(ptr @10, ptr @12)
  store i32 %255, ptr %252, align 16
  br label %247
}

declare i32 @simRand() local_unnamed_addr #2

declare void @simFlush(...) local_unnamed_addr #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smin.i32(i32, i32) #3

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #4

declare void @usersAndOperandsLogger(ptr, ptr)

attributes #0 = { nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #5 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.mustprogress"}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = distinct !{!11, !6}
!12 = distinct !{!12, !6}
!13 = distinct !{!13, !6}
!14 = distinct !{!14, !6}
!15 = distinct !{!15, !6}
!16 = distinct !{!16, !6}
!17 = distinct !{!17, !6}
!18 = distinct !{!18, !6}
