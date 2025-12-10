import 'package:dio/dio.dart';
import 'package:teachers_dashboard/core/services/dio_client.dart';

class SubjectsRepo {
  final DioClient _dioClient = DioClient();
  Future<dynamic> getTeacherSubjects() async {
    try {
      final response = await _dioClient.dio.get(
        '/api/Teachers/TeacherSubjectsOfCurrentTeacher',
      );
      return response.data;
    } on DioException catch (e) {
      return e.response?.data['message'] ??
          'Failed to get Teacher Subjects Of Current Teacher';
    }
  }

  Future<dynamic> getTeacherSubjectLessons({
    required String teacherSubjectId,
  }) async {
    try {
      final response = await _dioClient.dio.get(
        '/api/Teachers/TeacherSubjectLessonsAttachmentsByCurrentTeacher',
        queryParameters: {'teacherSubjectId': teacherSubjectId},
      );
      return response.data;
    } on DioException catch (e) {
      return e.response?.data['message'] ??
          'Failed to get lessons + attachments';
    }
  }
}
