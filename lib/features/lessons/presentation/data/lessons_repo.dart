import 'package:dio/dio.dart';
import 'package:teachers_dashboard/core/services/dio_client.dart';

class LessonsRepo {
  final DioClient _dioClient = DioClient();

  Future<dynamic> createLesson({
    required String lessontitle,
    required String lessondescription,
    required int? sort,
    required String teachersubjectid,
  }) async {
    try {
      final responce = await _dioClient.dio.post(
        '/api/Teachers/CreateLesson',
        data: {
          'lessontitle': lessontitle,
          'lessondescription': lessondescription,
          'sort': sort,
          'teachersubjectid': teachersubjectid,
        },
      );
      return responce.data;
    } on DioException catch (e) {
      return {
        'success': false,
        'message': e.response?.data["message"] ?? "Failed to create lesson",
      };
    }
  }

  Future<dynamic> updateLesson({
    required String id,
    required String lessonTitle,
    required String lessonDescription,
    required int sort,
    required String teacherSubjectId,
  }) async {
    try {
      final responce = await _dioClient.dio.put(
        '/api/Teachers/UpdateLesson',
        data: {
          "id": id,
          "lessontitle": lessonTitle,
          "lessondescription": lessonDescription,
          "sort": sort,
          "teachersubjectid": teacherSubjectId,
        },
      );
      return responce.data;
    } on DioException catch (e) {
      return {
        'success': false,
        'message': e.response?.data["message"] ?? "Failed to update lesson",
      };
    }
  }

  Future<dynamic> deleteLesson({required String lessonId}) async {
    try {
      final responce = await _dioClient.dio.delete(
        '/api/Teachers/DeleteLesson',
        queryParameters: {'lessonId': lessonId},
      );
      return responce.data;
    } on DioException catch (e) {
      return {
        'success': false,
        'message': e.response?.data["message"] ?? "Failed to delete lesson",
      };
    }
  }
}
