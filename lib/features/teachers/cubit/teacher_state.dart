abstract class TeacherState {}

class TeacherInitial extends TeacherState {}

class TeacherLoading extends TeacherState {}

class TeacherFailure extends TeacherState {
  final String errorMsg;
  TeacherFailure(this.errorMsg);
}

// Subjects state

class TeacherSubjectsLoaded extends TeacherState {
  final dynamic subjects;
  TeacherSubjectsLoaded(this.subjects);
}

// Lesson state

class LessonCreated extends TeacherState {}

class LessonUpdated extends TeacherState {}

class LessonDeleted extends TeacherState {}

// Attachment state

class AttachmentCreated extends TeacherState {}

class AttachmentDeleted extends TeacherState {}
