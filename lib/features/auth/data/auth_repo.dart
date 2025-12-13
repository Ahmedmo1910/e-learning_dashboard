import 'package:dio/dio.dart';
import 'package:teachers_dashboard/core/helper_functions/secure_storage.dart';
import 'package:teachers_dashboard/core/services/dio_client.dart';
import 'package:teachers_dashboard/generated/l10n.dart';

class AuthRepo {
  final DioClient _dioClient = DioClient();

  Future<dynamic> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dioClient.dio.post(
        '/api/Auth/login',
        data: {'email': email, 'password': password},
      );

      final data = response.data;

      if (data['success'] == true && data['auth'] != null) {
        final token = data['auth']['token'];
        final refreshToken = data['auth']['refreshtoken'];
        final expiry = data['auth']['tokenexpiry'];

        if (token != null && refreshToken != null && expiry != null) {
          await SecureStorage.saveTokens(
            accessToken: token,
            refreshToken: refreshToken,
            expiry: expiry,
          );
        }
      }

      return data;
    } on DioException catch (e) {
      if (e.response != null && e.response?.data != null) {
        return {
          "success": false,
          "message": e.response?.data['message'] ?? 'something went wrong',
        };
      }
      return {"success": false, "message": 'Check your internet connection'};
    }
  }

  Future<dynamic> logout() async {
    try {
      final response = await _dioClient.dio.post('/api/Auth/logout');
      return response.data;
    } on DioException catch (e) {
      return {
        "success": false,
        "message": e.response?.data['message'] ?? 'Logout failed',
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
        "message": e.response?.data["message"] ?? S.current.otpSendFailed,
      };
    }
  }

  Future<dynamic> verifyOtp({
    required String email,
    required String otp,
  }) async {
    try {
      final response = await _dioClient.dio.post(
        '/api/Auth/password/verifyotp',
        data: {'email': email, 'otp': otp},
      );
      return response.data;
    } on DioException catch (e) {
      return {
        "success": false,
        "message": e.response?.data["message"] ??  S.current.otpVerifyFailed,
      };
    }
  }

  Future<dynamic> resetPassword({
    required String email,
    required String newPassword,
    required String resetToken,
  }) async {
    try {
      final response = await _dioClient.dio.post(
        '/api/Auth/password/reset',
        data: {'email': email, 'newpassword': newPassword, 'token': resetToken},
      );
      return response.data;
    } on DioException catch (e) {
      return {
        "success": false,
        "message": e.response?.data["message"] ??  S.current.resetFailed,
      };
    }
  }

  Future<bool> refreshToken() async {
    try {
      final refresh = await SecureStorage.getRefreshToken();
      if (refresh == null) {
        return false;
      }

      final response = await _dioClient.dio.post(
        '/api/Auth/token/refresh',
        data: {
          "refreshtoken": refresh,
          "useragent": "mobile-app",
          "ip": "0.0.0.0",
        },
      );

      final data = response.data;

      if (data["success"] == true && data["auth"] != null) {
        await SecureStorage.saveTokens(
          accessToken: data["auth"]["token"],
          refreshToken: data["auth"]["refreshtoken"],
          expiry: data["auth"]["tokenexpiry"],
        );
        return true;
      }

      return false;
    } on DioException {
      return false;
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
