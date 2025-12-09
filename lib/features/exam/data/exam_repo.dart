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
      print("🔍 API DEBUG:");
      print("Raw response: $response");
      print("Success: ${response.data['success']}");
      print("Message: ${response.data['message']}");
      print("Status Code: ${response.data['statusCode']}");
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
}
