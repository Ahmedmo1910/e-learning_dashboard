import 'package:dio/dio.dart';
import 'package:teachers_dashboard/core/services/dio_client.dart';

class StudentRepo {
  final DioClient _dioClient = DioClient();
  Future<dynamic> getAllStudents() async {
    try {
      final response = await _dioClient.dio.get('/api/GetAllinfo/Students');
      return response.data['value'];
    } on DioException catch (e) {
      return e.response?.data['message'] ?? 'Failed to get Students';
    }
  }
}
