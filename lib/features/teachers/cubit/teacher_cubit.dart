import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teachers_dashboard/features/teachers/cubit/teacher_state.dart';
import 'package:teachers_dashboard/features/teachers/techer_repo.dart';

class TeacherCubit extends Cubit<TeacherState> {
  final TecherRepo _techerRepo = TecherRepo();
  TeacherCubit() : super(TeacherInitial());

  Future<void> getTeacherSubjects({required String teacherId}) async {
    emit(TeacherLoading());
    final responce = await _techerRepo.getTeacherSubjects(teacherId: teacherId);
    if (responce['success'] == true) {
      emit(TeacherSubjectsLoaded(responce['data'] ?? responce));
    } else {
      emit(TeacherFailure(responce['message'] ?? "Failed to load subjects"));
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
    if (responce['success'] == true) {
      emit(LessonCreated());
    } else {
      emit(TeacherFailure(responce['message'] ?? "Failed to create lesson"));
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
    if (responce['success'] == true) {
      emit(LessonUpdated());
    } else {
      emit(TeacherFailure(responce['message'] ?? "Failed to update lesson"));
    }
  }

  Future<void> deleteLesson({required String lessonId}) async {
    emit(TeacherLoading());
    final responce = await _techerRepo.deleteLesson(lessonId: lessonId);
    if (responce['success'] == true) {
      emit(LessonDeleted());
    } else {
      emit(TeacherFailure(responce['message'] ?? "Failed to delete lesson"));
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
    if (responce['success'] == true) {
      emit(AttachmentCreated());
    } else {
      emit(
        TeacherFailure(responce['message'] ?? "Failed to create attachment"),
      );
    }
  }

  Future<void> deleteAttachment({required String attachmentId}) async {
    emit(TeacherLoading());
    final responce = await _techerRepo.deleteAttachment(
      attachmentId: attachmentId,
    );
    if (responce['success'] == true) {
      emit(AttachmentDeleted());
    } else {
      emit(
        TeacherFailure(responce['message'] ?? "Failed to delete attachment"),
      );
    }
  }
}
