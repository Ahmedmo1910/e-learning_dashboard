import 'package:dio/dio.dart';
import 'package:teachers_dashboard/core/services/dio_client.dart';

class ProfileRepo {
  final DioClient _dioClient = DioClient();
  Future<dynamic> getTeacherProfile() async {
    try {
      final response = await _dioClient.dio.get('/api/Teachers/profile');
      return response.data;
    } on DioException catch (e) {
      return e.response?.data['message'] ?? 'Failed to get Profile ';
    }
  }
}
