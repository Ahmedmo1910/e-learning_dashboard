import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teachers_dashboard/features/exam/data/exam_repo.dart';
part 'exam_state.dart';

class ExamCubit extends Cubit<ExamState> {
  final ExamRepo _examRepo = ExamRepo();
  ExamCubit() : super(ExamInitial());

  Future<void> createAttachment({
    required String teacherSubjectLessonId,
    required String attachment,
    required String attachmentUrl,
    required String attachmentTitle,
    required String attachmentDescription,
  }) async {
    emit(ExamLoading());
    try {
      final response = await _examRepo.createAttachment(
        teacherSubjectLessonId: teacherSubjectLessonId,
        attachment: attachment,
        attachmentUrl: attachmentUrl,
        attachmentTitle: attachmentTitle,
        attachmentDescription: attachmentDescription,
      );

      if (response['statusCode'] == 200) {
        emit(ExamCreated());
      } else {
        emit(ExamFailure(response['message'] ?? "Failed to create attachment"));
      }
    } catch (e) {
      emit(ExamFailure(e.toString()));
    }
  }

  Future<void> deleteAttachment({required String attachmentId}) async {
    emit(ExamLoading());
    try {
      final response = await _examRepo.deleteAttachment(
        attachmentId: attachmentId,
      );

      if (response['success'] == true) {
        emit(ExamDeleted());
      } else {
        emit(ExamFailure(response['message'] ?? "Failed to delete attachment"));
      }
    } catch (e) {
      emit(ExamFailure(e.toString()));
    }
  }

  Future<void> updateAttachment({
    required String id,
    required String attachmentUrl,
    required String attachmentTitle,
    required String attachmentDescription,
  }) async {
    emit(ExamLoading());
    try {
      final response = await _examRepo.updateAttachment(
        id: id,
        attachmentUrl: attachmentUrl,
        attachmentTitle: attachmentTitle,
        attachmentDescription: attachmentDescription,
      );

      if (response['statusCode'] == 200) {
        emit(ExamUpdated());
      } else {
        emit(ExamFailure(response['message'] ?? "Failed to update attachment"));
      }
    } catch (e) {
      emit(ExamFailure(e.toString()));
    }
  }

  Future<void> getAttachments({required String teacherSubjectLessonId}) async {
    emit(ExamLoading());
    try {
      final response = await _examRepo.getAttachmentsByLessonId(
        lessonId: teacherSubjectLessonId,
      );

      if (response['statusCode'] == 200) {
        emit(ExamLoaded(response['value'] as List<dynamic>));
      } else {
        emit(ExamFailure(response['message'] ?? 'Failed to load attachments'));
      }
    } catch (e) {
      emit(ExamFailure(e.toString()));
    }
  }
}
