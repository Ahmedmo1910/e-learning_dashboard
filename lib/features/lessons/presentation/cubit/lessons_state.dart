abstract class LessonsState {}

// Initial
class LessonsInitial extends LessonsState {}

// Loading
class LessonsLoading extends LessonsState {}

// Success States
class LessonCreated extends LessonsState {}

class LessonUpdated extends LessonsState {}

class LessonDeleted extends LessonsState {}

class LessonsLoaded extends LessonsState {
  final dynamic lessons;
  LessonsLoaded(this.lessons);
}

// Failure
class LessonsFailure extends LessonsState {
  final String errorMsg;
  LessonsFailure(this.errorMsg);
}
