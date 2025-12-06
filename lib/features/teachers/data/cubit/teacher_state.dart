abstract class TeacherState {}

class TeacherInitial extends TeacherState {}

class TeacherLoading extends TeacherState {}

class TeacherFailure extends TeacherState {
  final String errorMsg;
  TeacherFailure(this.errorMsg);
}

// Subjects state

class GetTeacherSubjectsByTeacherId extends TeacherState {
  final dynamic subjects;
  GetTeacherSubjectsByTeacherId(this.subjects);
}

class GetTeacherSubjectsOfCurrentTeacher extends TeacherState {
  final dynamic subjects;
  GetTeacherSubjectsOfCurrentTeacher(this.subjects);
}

class GetTeacherSubjectLessonsAttachmentsByCurrentTeache extends TeacherState {
  final dynamic subjects;
  GetTeacherSubjectLessonsAttachmentsByCurrentTeache(this.subjects);
}

class GetStudentsInClassroom extends TeacherState {
  final dynamic students;
  GetStudentsInClassroom(this.students);
}
// Lesson state

class LessonCreated extends TeacherState {}

class LessonUpdated extends TeacherState {}

class LessonDeleted extends TeacherState {}

// Attachment state

class AttachmentCreated extends TeacherState {}

class AttachmentDeleted extends TeacherState {}

// Submit

class SubmitAttendance extends TeacherState {}

class SubmitGrades extends TeacherState {}
