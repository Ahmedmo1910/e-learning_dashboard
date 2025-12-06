import 'exam_api.dart';

class ExamRepository {
  final ExamApi api;

  ExamRepository({required this.api});

  Future<void> addExam({
    required String teacherSubjectLessonId,
    required String attachment,
    required String attachmentUrl,
    required String attachmentTitle,
    required String attachmentDescription,
  }) async {
    await api.createExam(
      teacherSubjectLessonId: teacherSubjectLessonId,
      attachment: attachment,
      attachmentUrl: attachmentUrl,
      attachmentTitle: attachmentTitle,
      attachmentDescription: attachmentDescription,
    );
  }

  Future<void> removeExam({required String attachmentId}) async {
    await api.deleteExam(attachmentId: attachmentId);
  }
}