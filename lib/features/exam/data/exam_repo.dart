import 'package:dio/dio.dart';
import 'package:teachers_dashboard/core/services/dio_client.dart';

class ExamRepo {
  final DioClient _dioClient = DioClient();

  Future<dynamic> createAttachment({
    required String teacherSubjectLessonId,
    required String attachment,
    required String attachmentUrl,
    required String attachmentTitle,
    required String attachmentDescription,
  }) async {
    try {
      final response = await _dioClient.dio.post(
        '/api/Teachers/CreateAttachment',
        data: {
          "teachersubjectlessonid": teacherSubjectLessonId,
          "attachment": attachment,
          "attachmenturl": attachmentUrl,
          "attachmenttitle": attachmentTitle,
          "attachmentdescription": attachmentDescription,
        },
      );
      return response.data;
    } on DioException catch (e) {
      return {
        'success': false,
        'message': e.response?.data["message"] ?? "Failed to create attachment",
      };
    }
  }

  Future<dynamic> deleteAttachment({required String attachmentId}) async {
    try {
      final response = await _dioClient.dio.delete(
        '/api/Teachers/DeleteAttachment',
        queryParameters: {'attachmentId': attachmentId},
      );
      return response.data;
    } on DioException catch (e) {
      return {
        'success': false,
        'message': e.response?.data["message"] ?? "Failed to delete attachment",
      };
    }
  }

  Future<dynamic> updateAttachment({
    required String id,
    required String attachmentUrl,
    required String attachmentTitle,
    required String attachmentDescription,
  }) async {
    try {
      final response = await _dioClient.dio.put(
        '/api/Teachers/UpdateAttachment',
        data: {
          "id": id,
          "attachmenturl": attachmentUrl,
          "attachmenttitle": attachmentTitle,
          "attachmentdescription": attachmentDescription,
        },
      );
      return response.data;
    } on DioException catch (e) {
      return {
        'success': false,
        'message': e.response?.data["message"] ?? "Failed to update attachment",
      };
    }
  }

  Future<dynamic> getAttachmentsByLessonId({required String lessonId}) async {
    try {
      final response = await _dioClient.dio.get(
        '/api/Teachers/GetAttachmentsByLessonId',
        queryParameters: {'lessonId': lessonId},
      );
      return response.data;
    } on DioException catch (e) {
      return {
        'success': false,
        'message': e.response?.data['message'] ?? 'Failed to load attachments',
      };
    }
  }
}
