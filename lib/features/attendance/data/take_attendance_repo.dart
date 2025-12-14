import 'package:teachers_dashboard/core/services/dio_client.dart';

class TakeAttendanceRepo {
  final DioClient _dioClient = DioClient();

  Future<void> submitAttendance(List<Map<String, dynamic>> body) async {
    await _dioClient.dio.post('/api/Teachers/attendance/batch', data: body);
  }
}
