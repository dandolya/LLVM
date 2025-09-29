; ModuleID = 'app.c'
source_filename = "app.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@imgNext = internal unnamed_addr global [1024 x [512 x i32]] zeroinitializer, align 16
@imgPrev = internal unnamed_addr global [1024 x [512 x i32]] zeroinitializer, align 16
@bufferX = internal global [6200 x i32] zeroinitializer, align 16
@bufferY = internal global [6200 x i32] zeroinitializer, align 16

; Function Attrs: nounwind optsize uwtable
define dso_local void @paint(i32 noundef %0) local_unnamed_addr #0 {
  br label %2

2:                                                ; preds = %1, %7
  %3 = phi i64 [ 0, %1 ], [ %8, %7 ]
  %4 = phi i32 [ 0, %1 ], [ %29, %7 ]
  %5 = trunc i64 %3 to i32
  br label %10

6:                                                ; preds = %7
  tail call void @simPutPixels(ptr noundef nonnull @bufferX, ptr noundef nonnull @bufferY, i32 noundef %0, i32 noundef %29) #4
  ret void

7:                                                ; preds = %28
  %8 = add nuw nsw i64 %3, 1
  %9 = icmp eq i64 %8, 1024
  br i1 %9, label %6, label %2, !llvm.loop !5

10:                                               ; preds = %2, %28
  %11 = phi i64 [ 0, %2 ], [ %30, %28 ]
  %12 = phi i32 [ %4, %2 ], [ %29, %28 ]
  %13 = getelementptr inbounds [1024 x [512 x i32]], ptr @imgNext, i64 0, i64 %3, i64 %11
  %14 = load i32, ptr %13, align 4, !tbaa !7
  %15 = getelementptr inbounds [1024 x [512 x i32]], ptr @imgPrev, i64 0, i64 %3, i64 %11
  %16 = load i32, ptr %15, align 4, !tbaa !7
  %17 = icmp eq i32 %14, %16
  br i1 %17, label %28, label %18

18:                                               ; preds = %10
  %19 = icmp ne i32 %14, %0
  %20 = icmp sgt i32 %12, 6199
  %21 = select i1 %19, i1 true, i1 %20
  br i1 %21, label %28, label %22

22:                                               ; preds = %18
  %23 = sext i32 %12 to i64
  %24 = getelementptr inbounds [6200 x i32], ptr @bufferX, i64 0, i64 %23
  store i32 %5, ptr %24, align 4, !tbaa !7
  %25 = getelementptr inbounds [6200 x i32], ptr @bufferY, i64 0, i64 %23
  %26 = trunc i64 %11 to i32
  store i32 %26, ptr %25, align 4, !tbaa !7
  %27 = add nsw i32 %12, 1
  store i32 %0, ptr %15, align 4, !tbaa !7
  br label %28

28:                                               ; preds = %10, %18, %22
  %29 = phi i32 [ %12, %18 ], [ %27, %22 ], [ %12, %10 ]
  %30 = add nuw nsw i64 %11, 1
  %31 = icmp eq i64 %30, 512
  br i1 %31, label %7, label %10, !llvm.loop !11
}

; Function Attrs: optsize
declare void @simPutPixels(ptr noundef, ptr noundef, i32 noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: nounwind optsize uwtable
define dso_local void @app() local_unnamed_addr #0 {
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(2097152) @imgPrev, i8 0, i64 2097152, i1 false), !tbaa !7
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(2097152) @imgNext, i8 0, i64 2097152, i1 false), !tbaa !7
  br label %1

1:                                                ; preds = %0, %108
  %2 = phi i32 [ %109, %108 ], [ 0, %0 ]
  br label %4

3:                                                ; preds = %108
  ret void

4:                                                ; preds = %1, %7
  %5 = phi i64 [ 0, %1 ], [ %8, %7 ]
  %6 = phi i32 [ 0, %1 ], [ %24, %7 ]
  br label %10

7:                                                ; preds = %23
  %8 = add nuw nsw i64 %5, 1
  %9 = icmp eq i64 %8, 1024
  br i1 %9, label %32, label %4, !llvm.loop !12

10:                                               ; preds = %4, %23
  %11 = phi i64 [ 510, %4 ], [ %25, %23 ]
  %12 = phi i32 [ %6, %4 ], [ %24, %23 ]
  %13 = getelementptr inbounds [1024 x [512 x i32]], ptr @imgNext, i64 0, i64 %5, i64 %11
  %14 = load i32, ptr %13, align 4, !tbaa !7
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %23, label %16

16:                                               ; preds = %10
  %17 = add nuw nsw i64 %11, 1
  %18 = getelementptr inbounds [1024 x [512 x i32]], ptr @imgNext, i64 0, i64 %5, i64 %17
  %19 = load i32, ptr %18, align 4, !tbaa !7
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %21, label %23

21:                                               ; preds = %16
  store i32 0, ptr %13, align 4, !tbaa !7
  store i32 16777215, ptr %18, align 4, !tbaa !7
  %22 = add nsw i32 %12, 1
  br label %23

23:                                               ; preds = %10, %16, %21
  %24 = phi i32 [ %22, %21 ], [ %12, %16 ], [ %12, %10 ]
  %25 = add nsw i64 %11, -1
  %26 = icmp eq i64 %11, 0
  br i1 %26, label %7, label %10, !llvm.loop !13

27:                                               ; preds = %90
  %28 = icmp sgt i32 %91, 0
  br i1 %28, label %30, label %29

29:                                               ; preds = %97, %27
  br label %111

30:                                               ; preds = %27
  %31 = zext nneg i32 %91 to i64
  br label %93

32:                                               ; preds = %7, %90
  %33 = phi i64 [ %38, %90 ], [ 0, %7 ]
  %34 = phi i32 [ %91, %90 ], [ 510, %7 ]
  %35 = icmp eq i64 %33, 0
  %36 = add nsw i64 %33, -1
  %37 = icmp eq i64 %33, 1023
  %38 = add nuw nsw i64 %33, 1
  br label %39

39:                                               ; preds = %32, %79
  %40 = phi i32 [ 510, %32 ], [ %82, %79 ]
  %41 = phi i32 [ 0, %32 ], [ %80, %79 ]
  %42 = phi i32 [ 0, %32 ], [ %81, %79 ]
  %43 = phi i32 [ %34, %32 ], [ %49, %79 ]
  %44 = zext nneg i32 %40 to i64
  %45 = getelementptr inbounds [1024 x [512 x i32]], ptr @imgNext, i64 0, i64 %33, i64 %44
  %46 = load i32, ptr %45, align 4, !tbaa !7
  %47 = icmp eq i32 %46, 0
  br i1 %47, label %90, label %48

48:                                               ; preds = %39
  %49 = tail call i32 @llvm.smin.i32(i32 %43, i32 %40)
  br i1 %35, label %58, label %50

50:                                               ; preds = %48
  %51 = getelementptr inbounds [1024 x [512 x i32]], ptr @imgNext, i64 0, i64 %36, i64 %44
  %52 = load i32, ptr %51, align 4, !tbaa !7
  %53 = icmp eq i32 %52, 0
  %54 = add nsw i32 %42, 1
  %55 = select i1 %53, i32 %54, i32 0
  br i1 %37, label %56, label %58

56:                                               ; preds = %50
  %57 = icmp eq i32 %55, 3
  br i1 %57, label %76, label %79

58:                                               ; preds = %48, %50
  %59 = phi i32 [ %55, %50 ], [ 0, %48 ]
  %60 = getelementptr inbounds [1024 x [512 x i32]], ptr @imgNext, i64 0, i64 %38, i64 %44
  %61 = load i32, ptr %60, align 4, !tbaa !7
  %62 = icmp eq i32 %61, 0
  %63 = add nsw i32 %41, 1
  %64 = select i1 %62, i32 %63, i32 0
  %65 = icmp eq i32 %59, 3
  %66 = icmp eq i32 %64, 3
  %67 = select i1 %65, i1 %66, i1 false
  br i1 %67, label %68, label %75

68:                                               ; preds = %58
  store i32 0, ptr %45, align 4, !tbaa !7
  %69 = add nuw nsw i32 %40, 1
  %70 = zext nneg i32 %69 to i64
  %71 = getelementptr inbounds [1024 x [512 x i32]], ptr @imgNext, i64 0, i64 %33, i64 %70
  store i32 0, ptr %71, align 4, !tbaa !7
  %72 = add nuw nsw i32 %40, 2
  %73 = zext nneg i32 %72 to i64
  %74 = getelementptr inbounds [1024 x [512 x i32]], ptr @imgNext, i64 0, i64 %36, i64 %73
  store i32 16777215, ptr %74, align 4, !tbaa !7
  br label %84

75:                                               ; preds = %58
  br i1 %65, label %76, label %77

76:                                               ; preds = %56, %75
  store i32 0, ptr %45, align 4, !tbaa !7
  br label %84

77:                                               ; preds = %75
  br i1 %66, label %78, label %79

78:                                               ; preds = %77
  store i32 0, ptr %45, align 4, !tbaa !7
  br label %84

79:                                               ; preds = %56, %77
  %80 = phi i32 [ %64, %77 ], [ 0, %56 ]
  %81 = phi i32 [ %59, %77 ], [ %55, %56 ]
  %82 = add nsw i32 %40, -1
  %83 = icmp eq i32 %40, 0
  br i1 %83, label %90, label %39, !llvm.loop !14

84:                                               ; preds = %68, %76, %78
  %85 = phi i32 [ -2, %68 ], [ -1, %76 ], [ -1, %78 ]
  %86 = phi i64 [ %38, %68 ], [ %36, %76 ], [ %38, %78 ]
  %87 = add nsw i32 %40, %85
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds [1024 x [512 x i32]], ptr @imgNext, i64 0, i64 %86, i64 %88
  store i32 16777215, ptr %89, align 4, !tbaa !7
  br label %90

90:                                               ; preds = %39, %79, %84
  %91 = phi i32 [ %49, %84 ], [ %49, %79 ], [ %43, %39 ]
  %92 = icmp eq i64 %38, 1024
  br i1 %92, label %27, label %32, !llvm.loop !15

93:                                               ; preds = %30, %97
  %94 = phi i64 [ 0, %30 ], [ %99, %97 ]
  %95 = getelementptr inbounds [512 x i32], ptr @imgNext, i64 0, i64 %94
  %96 = load i32, ptr %95, align 4, !tbaa !7
  br label %101

97:                                               ; preds = %101
  %98 = getelementptr inbounds [1024 x [512 x i32]], ptr @imgNext, i64 0, i64 1023, i64 %94
  store i32 %96, ptr %98, align 4, !tbaa !7
  %99 = add nuw nsw i64 %94, 1
  %100 = icmp eq i64 %99, %31
  br i1 %100, label %29, label %93, !llvm.loop !16

101:                                              ; preds = %93, %101
  %102 = phi i64 [ 0, %93 ], [ %103, %101 ]
  %103 = add nuw nsw i64 %102, 1
  %104 = getelementptr inbounds [1024 x [512 x i32]], ptr @imgNext, i64 0, i64 %103, i64 %94
  %105 = load i32, ptr %104, align 4, !tbaa !7
  %106 = getelementptr inbounds [1024 x [512 x i32]], ptr @imgNext, i64 0, i64 %102, i64 %94
  store i32 %105, ptr %106, align 4, !tbaa !7
  %107 = icmp eq i64 %103, 1023
  br i1 %107, label %97, label %101, !llvm.loop !17

108:                                              ; preds = %124
  tail call void @paint(i32 noundef 0) #5
  tail call void @paint(i32 noundef 16777215) #5
  tail call void (...) @simFlush() #4
  %109 = add nuw nsw i32 %2, 1
  %110 = icmp eq i32 %109, 1000000000
  br i1 %110, label %3, label %1, !llvm.loop !18

111:                                              ; preds = %29, %124
  %112 = phi i32 [ %126, %124 ], [ 0, %29 ]
  %113 = phi i32 [ %125, %124 ], [ %24, %29 ]
  %114 = icmp slt i32 %113, 5000
  br i1 %114, label %115, label %124

115:                                              ; preds = %111
  %116 = tail call i32 @simRand() #4
  %117 = srem i32 %116, 1024
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds [1024 x [512 x i32]], ptr @imgNext, i64 0, i64 %118
  %120 = load i32, ptr %119, align 16, !tbaa !7
  %121 = icmp eq i32 %120, 0
  br i1 %121, label %122, label %124

122:                                              ; preds = %115
  store i32 16777215, ptr %119, align 16, !tbaa !7
  %123 = add nsw i32 %113, 1
  br label %124

124:                                              ; preds = %115, %122, %111
  %125 = phi i32 [ %113, %111 ], [ %123, %122 ], [ %113, %115 ]
  %126 = add nuw nsw i32 %112, 1
  %127 = icmp eq i32 %126, 7
  br i1 %127, label %108, label %111, !llvm.loop !19
}

; Function Attrs: optsize
declare i32 @simRand() local_unnamed_addr #1

; Function Attrs: optsize
declare void @simFlush(...) local_unnamed_addr #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smin.i32(i32, i32) #2

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #3

attributes #0 = { nounwind optsize uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #4 = { nounwind optsize }
attributes #5 = { optsize }

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
