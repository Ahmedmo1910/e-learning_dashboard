import 'package:dio/dio.dart';
import 'package:teachers_dashboard/core/services/dio_client.dart';

class DashboardRepo {
  final DioClient _dioClient = DioClient();
  Future<dynamic> getTeacherProfile() async {
    try {
      final response = await _dioClient.dio.get('/api/Teachers/profile');
      return response.data;
    } on DioException catch (e) {
      return e.response?.data['message'] ?? 'Failed to get Profile ';
    }
  }

  Future<dynamic> getAllStudents() async {
    try {
      final response = await _dioClient.dio.get('/api/GetAllinfo/Students');
      return response.data['value'];
    } on DioException catch (e) {
      return e.response?.data['message'] ?? 'Failed to get Students';
    }
  }

  Future<dynamic> getAllClasses() async {
    try {
      final response = await _dioClient.dio.get('/api/GetAllinfo/Classes');
      return response.data['value'];
    } on DioException catch (e) {
      return e.response?.data['message'] ?? 'Failed to get Classes';
    }
  }

  Future<dynamic> getAllAttachments() async {
    try {
      final response = await _dioClient.dio.get(
        '/api/Teachers/GetAllAttachmentsOfCurrentTeacher',
      );
      return response.data['value'];
    } on DioException catch (e) {
      return e.response?.data['message'] ?? 'Failed to get Attachments';
    }
  }
}
