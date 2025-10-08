; ModuleID = 'app.c'
source_filename = "app.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize uwtable
define dso_local void @paint(i32 noundef %0, ptr nocapture noundef %1, ptr nocapture noundef readonly %2, ptr noundef %3, ptr noundef %4) local_unnamed_addr #0 {
  br label %6

6:                                                ; preds = %5, %11
  %7 = phi i64 [ 0, %5 ], [ %12, %11 ]
  %8 = phi i32 [ 0, %5 ], [ %34, %11 ]
  %9 = trunc i64 %7 to i32
  br label %14

10:                                               ; preds = %11
  tail call void @simPutPixels(ptr noundef %3, ptr noundef %4, i32 noundef %0, i32 noundef %34) #5
  ret void

11:                                               ; preds = %33
  %12 = add nuw nsw i64 %7, 1
  %13 = icmp eq i64 %12, 1024
  br i1 %13, label %10, label %6, !llvm.loop !5

14:                                               ; preds = %6, %33
  %15 = phi i64 [ 0, %6 ], [ %35, %33 ]
  %16 = phi i32 [ %8, %6 ], [ %34, %33 ]
  %17 = getelementptr inbounds [512 x i32], ptr %2, i64 %7, i64 %15
  %18 = load i32, ptr %17, align 4, !tbaa !7
  %19 = getelementptr inbounds [512 x i32], ptr %1, i64 %7, i64 %15
  %20 = load i32, ptr %19, align 4, !tbaa !7
  %21 = icmp eq i32 %18, %20
  br i1 %21, label %33, label %22

22:                                               ; preds = %14
  %23 = icmp ne i32 %18, %0
  %24 = icmp sgt i32 %16, 6199
  %25 = select i1 %23, i1 true, i1 %24
  br i1 %25, label %33, label %26

26:                                               ; preds = %22
  %27 = sext i32 %16 to i64
  %28 = getelementptr inbounds i32, ptr %3, i64 %27
  store i32 %9, ptr %28, align 4, !tbaa !7
  %29 = getelementptr inbounds i32, ptr %4, i64 %27
  %30 = trunc i64 %15 to i32
  store i32 %30, ptr %29, align 4, !tbaa !7
  %31 = add nsw i32 %16, 1
  %32 = load i32, ptr %17, align 4, !tbaa !7
  store i32 %32, ptr %19, align 4, !tbaa !7
  br label %33

33:                                               ; preds = %14, %22, %26
  %34 = phi i32 [ %16, %22 ], [ %31, %26 ], [ %16, %14 ]
  %35 = add nuw nsw i64 %15, 1
  %36 = icmp eq i64 %35, 512
  br i1 %36, label %11, label %14, !llvm.loop !11
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: optsize
declare void @simPutPixels(ptr noundef, ptr noundef, i32 noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: nounwind optsize uwtable
define dso_local void @app() local_unnamed_addr #0 {
  %1 = alloca [1024 x [512 x i32]], align 16
  %2 = alloca [1024 x [512 x i32]], align 16
  %3 = alloca [6200 x i32], align 16
  %4 = alloca [6200 x i32], align 16
  call void @llvm.lifetime.start.p0(i64 2097152, ptr nonnull %1) #6
  call void @llvm.lifetime.start.p0(i64 2097152, ptr nonnull %2) #6
  call void @llvm.lifetime.start.p0(i64 24800, ptr nonnull %3) #6
  call void @llvm.lifetime.start.p0(i64 24800, ptr nonnull %4) #6
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(2097152) %1, i8 0, i64 2097152, i1 false), !tbaa !7
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(2097152) %2, i8 0, i64 2097152, i1 false), !tbaa !7
  br label %5

5:                                                ; preds = %0, %112
  %6 = phi i32 [ %113, %112 ], [ 0, %0 ]
  br label %8

7:                                                ; preds = %112
  call void @llvm.lifetime.end.p0(i64 24800, ptr nonnull %4) #6
  call void @llvm.lifetime.end.p0(i64 24800, ptr nonnull %3) #6
  call void @llvm.lifetime.end.p0(i64 2097152, ptr nonnull %2) #6
  call void @llvm.lifetime.end.p0(i64 2097152, ptr nonnull %1) #6
  ret void

8:                                                ; preds = %5, %11
  %9 = phi i64 [ 0, %5 ], [ %12, %11 ]
  %10 = phi i32 [ 0, %5 ], [ %28, %11 ]
  br label %14

11:                                               ; preds = %27
  %12 = add nuw nsw i64 %9, 1
  %13 = icmp eq i64 %12, 1024
  br i1 %13, label %36, label %8, !llvm.loop !12

14:                                               ; preds = %8, %27
  %15 = phi i64 [ 510, %8 ], [ %29, %27 ]
  %16 = phi i32 [ %10, %8 ], [ %28, %27 ]
  %17 = getelementptr inbounds [1024 x [512 x i32]], ptr %2, i64 0, i64 %9, i64 %15
  %18 = load i32, ptr %17, align 4, !tbaa !7
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %27, label %20

20:                                               ; preds = %14
  %21 = add nuw nsw i64 %15, 1
  %22 = getelementptr inbounds [1024 x [512 x i32]], ptr %2, i64 0, i64 %9, i64 %21
  %23 = load i32, ptr %22, align 4, !tbaa !7
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %25, label %27

25:                                               ; preds = %20
  store i32 0, ptr %17, align 4, !tbaa !7
  store i32 16777215, ptr %22, align 4, !tbaa !7
  %26 = add nsw i32 %16, 1
  br label %27

27:                                               ; preds = %14, %20, %25
  %28 = phi i32 [ %26, %25 ], [ %16, %20 ], [ %16, %14 ]
  %29 = add nsw i64 %15, -1
  %30 = icmp eq i64 %15, 0
  br i1 %30, label %11, label %14, !llvm.loop !13

31:                                               ; preds = %94
  %32 = icmp sgt i32 %95, 0
  br i1 %32, label %34, label %33

33:                                               ; preds = %101, %31
  br label %115

34:                                               ; preds = %31
  %35 = zext nneg i32 %95 to i64
  br label %97

36:                                               ; preds = %11, %94
  %37 = phi i64 [ %42, %94 ], [ 0, %11 ]
  %38 = phi i32 [ %95, %94 ], [ 510, %11 ]
  %39 = icmp eq i64 %37, 0
  %40 = add nsw i64 %37, -1
  %41 = icmp eq i64 %37, 1023
  %42 = add nuw nsw i64 %37, 1
  br label %43

43:                                               ; preds = %36, %83
  %44 = phi i32 [ 510, %36 ], [ %86, %83 ]
  %45 = phi i32 [ 0, %36 ], [ %84, %83 ]
  %46 = phi i32 [ 0, %36 ], [ %85, %83 ]
  %47 = phi i32 [ %38, %36 ], [ %53, %83 ]
  %48 = zext nneg i32 %44 to i64
  %49 = getelementptr inbounds [1024 x [512 x i32]], ptr %2, i64 0, i64 %37, i64 %48
  %50 = load i32, ptr %49, align 4, !tbaa !7
  %51 = icmp eq i32 %50, 0
  br i1 %51, label %94, label %52

52:                                               ; preds = %43
  %53 = call i32 @llvm.smin.i32(i32 %47, i32 %44)
  br i1 %39, label %62, label %54

54:                                               ; preds = %52
  %55 = getelementptr inbounds [1024 x [512 x i32]], ptr %2, i64 0, i64 %40, i64 %48
  %56 = load i32, ptr %55, align 4, !tbaa !7
  %57 = icmp eq i32 %56, 0
  %58 = add nsw i32 %46, 1
  %59 = select i1 %57, i32 %58, i32 0
  br i1 %41, label %60, label %62

60:                                               ; preds = %54
  %61 = icmp eq i32 %59, 3
  br i1 %61, label %80, label %83

62:                                               ; preds = %52, %54
  %63 = phi i32 [ %59, %54 ], [ 0, %52 ]
  %64 = getelementptr inbounds [1024 x [512 x i32]], ptr %2, i64 0, i64 %42, i64 %48
  %65 = load i32, ptr %64, align 4, !tbaa !7
  %66 = icmp eq i32 %65, 0
  %67 = add nsw i32 %45, 1
  %68 = select i1 %66, i32 %67, i32 0
  %69 = icmp eq i32 %63, 3
  %70 = icmp eq i32 %68, 3
  %71 = select i1 %69, i1 %70, i1 false
  br i1 %71, label %72, label %79

72:                                               ; preds = %62
  store i32 0, ptr %49, align 4, !tbaa !7
  %73 = add nuw nsw i32 %44, 1
  %74 = zext nneg i32 %73 to i64
  %75 = getelementptr inbounds [1024 x [512 x i32]], ptr %2, i64 0, i64 %37, i64 %74
  store i32 0, ptr %75, align 4, !tbaa !7
  %76 = add nuw nsw i32 %44, 2
  %77 = zext nneg i32 %76 to i64
  %78 = getelementptr inbounds [1024 x [512 x i32]], ptr %2, i64 0, i64 %40, i64 %77
  store i32 16777215, ptr %78, align 4, !tbaa !7
  br label %88

79:                                               ; preds = %62
  br i1 %69, label %80, label %81

80:                                               ; preds = %60, %79
  store i32 0, ptr %49, align 4, !tbaa !7
  br label %88

81:                                               ; preds = %79
  br i1 %70, label %82, label %83

82:                                               ; preds = %81
  store i32 0, ptr %49, align 4, !tbaa !7
  br label %88

83:                                               ; preds = %60, %81
  %84 = phi i32 [ %68, %81 ], [ 0, %60 ]
  %85 = phi i32 [ %63, %81 ], [ %59, %60 ]
  %86 = add nsw i32 %44, -1
  %87 = icmp eq i32 %44, 0
  br i1 %87, label %94, label %43, !llvm.loop !14

88:                                               ; preds = %72, %80, %82
  %89 = phi i32 [ -2, %72 ], [ -1, %80 ], [ -1, %82 ]
  %90 = phi i64 [ %42, %72 ], [ %40, %80 ], [ %42, %82 ]
  %91 = add nsw i32 %44, %89
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds [1024 x [512 x i32]], ptr %2, i64 0, i64 %90, i64 %92
  store i32 16777215, ptr %93, align 4, !tbaa !7
  br label %94

94:                                               ; preds = %43, %83, %88
  %95 = phi i32 [ %53, %88 ], [ %53, %83 ], [ %47, %43 ]
  %96 = icmp eq i64 %42, 1024
  br i1 %96, label %31, label %36, !llvm.loop !15

97:                                               ; preds = %34, %101
  %98 = phi i64 [ 0, %34 ], [ %103, %101 ]
  %99 = getelementptr inbounds [512 x i32], ptr %2, i64 0, i64 %98
  %100 = load i32, ptr %99, align 4, !tbaa !7
  br label %105

101:                                              ; preds = %105
  %102 = getelementptr inbounds [1024 x [512 x i32]], ptr %2, i64 0, i64 1023, i64 %98
  store i32 %100, ptr %102, align 4, !tbaa !7
  %103 = add nuw nsw i64 %98, 1
  %104 = icmp eq i64 %103, %35
  br i1 %104, label %33, label %97, !llvm.loop !16

105:                                              ; preds = %97, %105
  %106 = phi i64 [ 0, %97 ], [ %107, %105 ]
  %107 = add nuw nsw i64 %106, 1
  %108 = getelementptr inbounds [1024 x [512 x i32]], ptr %2, i64 0, i64 %107, i64 %98
  %109 = load i32, ptr %108, align 4, !tbaa !7
  %110 = getelementptr inbounds [1024 x [512 x i32]], ptr %2, i64 0, i64 %106, i64 %98
  store i32 %109, ptr %110, align 4, !tbaa !7
  %111 = icmp eq i64 %107, 1023
  br i1 %111, label %101, label %105, !llvm.loop !17

112:                                              ; preds = %128
  call void @paint(i32 noundef 0, ptr noundef nonnull %1, ptr noundef nonnull %2, ptr noundef nonnull %3, ptr noundef nonnull %4) #7
  call void @paint(i32 noundef 16777215, ptr noundef nonnull %1, ptr noundef nonnull %2, ptr noundef nonnull %3, ptr noundef nonnull %4) #7
  call void (...) @simFlush() #5
  %113 = add nuw nsw i32 %6, 1
  %114 = icmp eq i32 %113, 1000000000
  br i1 %114, label %7, label %5, !llvm.loop !18

115:                                              ; preds = %33, %128
  %116 = phi i32 [ %130, %128 ], [ 0, %33 ]
  %117 = phi i32 [ %129, %128 ], [ %28, %33 ]
  %118 = icmp slt i32 %117, 5000
  br i1 %118, label %119, label %128

119:                                              ; preds = %115
  %120 = call i32 @simRand() #5
  %121 = srem i32 %120, 1024
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds [1024 x [512 x i32]], ptr %2, i64 0, i64 %122
  %124 = load i32, ptr %123, align 16, !tbaa !7
  %125 = icmp eq i32 %124, 0
  br i1 %125, label %126, label %128

126:                                              ; preds = %119
  store i32 16777215, ptr %123, align 16, !tbaa !7
  %127 = add nsw i32 %117, 1
  br label %128

128:                                              ; preds = %119, %126, %115
  %129 = phi i32 [ %117, %115 ], [ %127, %126 ], [ %117, %119 ]
  %130 = add nuw nsw i32 %116, 1
  %131 = icmp eq i32 %130, 7
  br i1 %131, label %112, label %115, !llvm.loop !19
}

; Function Attrs: optsize
declare i32 @simRand() local_unnamed_addr #2

; Function Attrs: optsize
declare void @simFlush(...) local_unnamed_addr #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smin.i32(i32, i32) #3

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #4

attributes #0 = { nounwind optsize uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { optsize "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #5 = { nounwind optsize }
attributes #6 = { nounwind }
attributes #7 = { optsize }

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
!19 = distinct !{!19, !6}
