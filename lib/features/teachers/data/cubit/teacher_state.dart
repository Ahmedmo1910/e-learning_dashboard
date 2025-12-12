import 'package:equatable/equatable.dart';

sealed class TeacherState extends Equatable {}

class TeacherInitial extends TeacherState {
  @override
  List<Object?> get props => [];
}

class TeacherLoading extends TeacherState {
  @override
  List<Object?> get props => [];
}

class TeacherFailure extends TeacherState {
  final String errorMsg;
  TeacherFailure(this.errorMsg);
  @override
  List<Object?> get props => [errorMsg];
}

// Subjects state

class GetTeacherSubjectsByTeacherId extends TeacherState {
  final dynamic subjects;
  GetTeacherSubjectsByTeacherId(this.subjects);
  @override
  List<Object?> get props => [subjects];
}

class GetTeacherSubjectsOfCurrentTeacher extends TeacherState {
  final dynamic subjects;
  GetTeacherSubjectsOfCurrentTeacher(this.subjects);
  @override
  List<Object?> get props => [subjects];
}

class GetTeacherSubjectLessonsAttachmentsByCurrentTeache extends TeacherState {
  final dynamic subjects;
  GetTeacherSubjectLessonsAttachmentsByCurrentTeache(this.subjects);
  @override
  List<Object?> get props => [subjects];
}

class GetStudentsInClassroom extends TeacherState {
  final dynamic students;
  GetStudentsInClassroom(this.students);
  @override
  List<Object?> get props => [students];
}
// Lesson state

class LessonCreated extends TeacherState {
  @override
  List<Object?> get props => [];
}

class LessonUpdated extends TeacherState {
  @override
  List<Object?> get props => [];
}

class LessonDeleted extends TeacherState {
  @override
  List<Object?> get props => [];
}

// Attachment state

class AttachmentCreated extends TeacherState {
  @override
  List<Object?> get props => [];
}

class AttachmentDeleted extends TeacherState {
  @override
  List<Object?> get props => [];
}

// Submit

class SubmitAttendance extends TeacherState {
  @override
  List<Object?> get props => [];
}

class SubmitGrades extends TeacherState {
  @override
  List<Object?> get props => [];
}

// class room

class GetClassroomsOfCurrentTeacher extends TeacherState {
  final List<Map<String, dynamic>> classrooms;

  GetClassroomsOfCurrentTeacher(this.classrooms);
  @override
  List<Object?> get props => [classrooms];
}

// profile

class GetTeacherProfile extends TeacherState {
  final Map profileInfo;
  GetTeacherProfile(this.profileInfo);
  @override
  List<Object?> get props => [profileInfo];
}
