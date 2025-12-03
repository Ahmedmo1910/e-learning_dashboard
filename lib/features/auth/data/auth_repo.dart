import 'package:dio/dio.dart';
import 'package:teachers_dashboard/core/services/api_pref_helper.dart';
import 'package:teachers_dashboard/core/services/dio_client.dart';

class AuthRepo {
  final DioClient _dioClient = DioClient();

  Future<dynamic> login({
    required String password,
    required String email,
  }) async {
    try {
      final responce = await _dioClient.dio.post(
        '/api/Auth/login',
        data: {'email': email, 'password': password},
      );
      final data = responce.data;
      if (data['success'] == true && data['auth'] != null) {
        final token = data['auth']['token'];
        if (token != null) {
          await ApiPrefHelper.saveToken(token);
        }
      }
      return data;
    } on DioException catch (e) {
      if (e.response != null && e.response?.data != null) {
        return {
          "success": false,
          "message": e.response?.data['message'] ?? 'something went wromg',
        };
      }
      return {"success": false, "message": 'Check your internet connection'};
    }
  }

  Future<dynamic> logout() async {
    try {
      final responce = await _dioClient.dio.post('/api/Auth/logout');
      return responce.data;
    } on DioException catch (e) {
      return {
        "success": false,
        "message": e.response?.data['message'] ?? 'Logout faild',
      };
    }
  }

  Future<dynamic> sendResetOtp({required String email}) async {
    try {
      final response = await _dioClient.dio.post(
        '/api/Auth/password/forgot?email=$email',
      );
      return response.data;
    } on DioException catch (e) {
      return {
        "success": false,
        "message": e.response?.data["message"] ?? "Failed to send OTP",
      };
    }
  }

  Future<dynamic> verifyOtp({
    required String email,
    required String otp,
  }) async {
    try {
      final responce = await _dioClient.dio.post(
        '/api/Auth/password/verifyotp',
        data: {'email': email, 'otp': otp},
      );
      return responce.data;
    } on DioException catch (e) {
      return {
        "success": false,
        "message": e.response?.data["message"] ?? "OTP verification failed",
      };
    }
  }

  Future<dynamic> resetPassword({
    required String email,
    required String newPassword,
    required String resetToken,
  }) async {
    try {
      final responce = await _dioClient.dio.post(
        '/api/Auth/password/reset',
        data: {'email': email, 'newpassword': newPassword, 'token': resetToken},
      );
      return responce.data;
    } on DioException catch (e) {
      return {
        "success": false,
        "message": e.response?.data["message"] ?? "Reset failed",
      };
    }
  }

  Future<dynamic> getUserData() async {
    try {
      final response = await _dioClient.dio.get('/api/Auth/me');
      return response.data;
    } on DioException catch (e) {
      return {
        "success": false,
        "message": e.response?.data["message"] ?? "Failed to get user data",
      };
    }
  }
}
