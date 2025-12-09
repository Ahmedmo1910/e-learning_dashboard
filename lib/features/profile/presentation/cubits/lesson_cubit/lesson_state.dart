part of 'lesson_cubit.dart';

sealed class LessonState {}

final class LessonInitial extends LessonState {}

final class LessonLoading extends LessonState {}

final class LessonSuccess extends LessonState {
    final dynamic lessons;
  LessonSuccess(this.lessons);
}

final class LessonFailure extends LessonState {
  final String errorMessage;
  LessonFailure(this.errorMessage);
}
