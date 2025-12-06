import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teachers_dashboard/features/teachers/data/attendence_model.dart';
import 'package:teachers_dashboard/features/teachers/data/cubit/teacher_state.dart';
import 'package:teachers_dashboard/features/teachers/data/grade_model.dart';
import 'package:teachers_dashboard/features/teachers/data/techer_repo.dart';

class TeacherCubit extends Cubit<TeacherState> {
  final TecherRepo _techerRepo = TecherRepo();
  TeacherCubit() : super(TeacherInitial());

  Future<void> getTeacherSubjectsByTeacherId({required String teacherId}) async {
    emit(TeacherLoading());
    final responce = await _techerRepo.getTeacherSubjectsByTeacherId(
      teacherId: teacherId,
    );
    if (responce is Map && responce['statusCode'] == 200) {
      emit(GetTeacherSubjectsByTeacherId(responce['value'] ?? responce));
    } else {
      emit(TeacherFailure(responce.toString()));
    }
  }

  Future<void> getTeacherSubjectsOfCurrentTeacher() async {
    emit(TeacherLoading());
    final responce = await _techerRepo.getTeacherSubjectsOfCurrentTeacher();
    if (responce is Map && responce['statusCode'] == 200) {
      emit(GetTeacherSubjectsOfCurrentTeacher(responce['value']));
    } else {
      emit(TeacherFailure(responce.toString()));
    }
  }

  Future<void> getTeacherSubjectLessonsAttachmentsByCurrentTeache({
    required String teacherSubjectId,
  }) async {
    emit(TeacherLoading());
    final responce = await _techerRepo
        .getTeacherSubjectLessonsAttachmentsByCurrentTeache(
          teacherSubjectId: teacherSubjectId,
        );
    if (responce is Map && responce['statusCode'] == 200) {
      emit(
        GetTeacherSubjectLessonsAttachmentsByCurrentTeache(responce['value']),
      );
    } else {
      emit(TeacherFailure(responce.toString()));
    }
  }

  Future<void> getStudentsInClassroom({required String classroomId}) async {
    emit(TeacherLoading());
    final responce = await _techerRepo.getStudentsInClassroom(
      classroomId: classroomId,
    );
    if (responce is Map && responce['statusCode'] == 200) {
      emit(GetStudentsInClassroom(responce['value']));
    } else {
      emit(TeacherFailure(responce.toString()));
    }
  }

  Future<void> createLesson({
    required String lessontitle,
    required String lessondescription,
    required int sort,
    required String teachersubjectid,
  }) async {
    emit(TeacherLoading());
    final responce = await _techerRepo.createLesson(
      lessontitle: lessontitle,
      lessondescription: lessondescription,
      sort: sort,
      teachersubjectid: teachersubjectid,
    );
    if (responce is Map && responce['statusCode'] == 200) {
      emit(LessonCreated());
    } else {
      emit(TeacherFailure(responce.toString()));
    }
  }

  Future<void> updateLesson({
    required String id,
    required String lessonTitle,
    required String lessonDescription,
    required int sort,
    required String teacherSubjectId,
  }) async {
    emit(TeacherLoading());
    final responce = await _techerRepo.updateLesson(
      id: id,
      lessonTitle: lessonTitle,
      lessonDescription: lessonDescription,
      sort: sort,
      teacherSubjectId: teacherSubjectId,
    );
    if (responce is Map && responce['statusCode'] == 200) {
      emit(LessonUpdated());
    } else {
      emit(TeacherFailure(responce.toString()));
    }
  }

  Future<void> deleteLesson({required String lessonId}) async {
    emit(TeacherLoading());
    final responce = await _techerRepo.deleteLesson(lessonId: lessonId);
    if (responce is Map && responce['statusCode'] == 200) {
      emit(LessonDeleted());
    } else {
      emit(TeacherFailure(responce.toString()));
    }
  }

  Future<void> createAttachment({
    required String teacherSubjectLessonId,
    required String attachment,
    required String attachmentUrl,
    required String attachmentTitle,
    required String attachmentDescription,
  }) async {
    emit(TeacherLoading());
    final responce = await _techerRepo.createAttachment(
      teacherSubjectLessonId: teacherSubjectLessonId,
      attachment: attachment,
      attachmentUrl: attachmentUrl,
      attachmentTitle: attachmentTitle,
      attachmentDescription: attachmentDescription,
    );
    if (responce is Map && responce['statusCode'] == 200) {
      emit(AttachmentCreated());
    } else {
      emit(TeacherFailure(responce.toString()));
    }
  }

  Future<void> deleteAttachment({required String attachmentId}) async {
    emit(TeacherLoading());
    final responce = await _techerRepo.deleteAttachment(
      attachmentId: attachmentId,
    );
    if (responce is Map && responce['statusCode'] == 200) {
      emit(AttachmentDeleted());
    } else {
      emit(TeacherFailure(responce.toString()));
    }
  }

  Future<void> submitAttendance({
    required List<AttendanceModel> attendanceList,
  }) async {
    emit(TeacherLoading());
    final responce = await _techerRepo.submitAttendance(
      attendanceList: attendanceList,
    );
    if (responce is Map && responce['statusCode'] == 200) {
      emit(SubmitAttendance());
    } else {
      emit(TeacherFailure(responce.toString()));
    }
  }

  Future<void> submitGrades({required List<GradeModel> gradesList}) async {
    emit(TeacherLoading());
    final responce = await _techerRepo.submitGrades(gradesList: gradesList);
    if (responce is Map && responce['statusCode'] == 200) {
      emit(SubmitGrades());
    } else {
      emit(TeacherFailure(responce.toString()));
    }
  }
}
