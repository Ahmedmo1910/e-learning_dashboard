import 'package:flutter/material.dart';
import 'package:teachers_dashboard/core/services/api_pref_helper.dart';
import 'package:teachers_dashboard/features/auth/data/auth_repo.dart';

class AuthProvider extends ChangeNotifier {
  final AuthRepo _authRepo = AuthRepo();
  bool isLoading = false;
  String? errorMsg;
  bool loginRequireOtp = false;
  void _startLoading() {
    isLoading = true;
    errorMsg = null;
    loginRequireOtp = false;
    notifyListeners();
  }

  void _stopLoading() {
    isLoading = false;
    notifyListeners();
  }

  Future<bool> login({required String password, required String email}) async {
    _startLoading();
    final response = await _authRepo.login(password: password, email: email);
    if (response["success"] == true && response["auth"] != null) {
      _stopLoading();
      return true;
    } else if (response["verification"]?["requiresOtpVerification"] == true) {
      loginRequireOtp = true;
      _stopLoading();
      return false;
    } else {
      errorMsg = response["message"] ?? "Login failed please try again";
      loginRequireOtp = false;
      _stopLoading();
      return false;
    }
  }

  Future<bool> logout() async {
    _startLoading();
    final response = await _authRepo.logout();
    if (response['success'] == true) {
      await ApiPrefHelper.removeToken();
      _stopLoading();
      return true;
    } else {
      errorMsg = response['message'] ?? 'Logout failed';
      _stopLoading();
      return false;
    }
  }

  Future<bool> sendResetOtp({required String email}) async {
    _startLoading();
    final response = await _authRepo.sendResetOtp(email: email);
    _stopLoading();
    if (response['success'] == true) {
      return true;
    } else {
      errorMsg = response['message'];
      return false;
    }
  }

  Future<String?> verifyOtp({
    required String email,
    required String otp,
  }) async {
    _startLoading();
    final response = await _authRepo.verifyOtp(email: email, otp: otp);
    _stopLoading();
    if (response['success'] == true) {
      return response['resettoken'];
    } else {
      errorMsg = response['message'];
      return null;
    }
  }

  Future<bool> resetPassword({
    required String email,
    required String newPassword,
    required String resetToken,
  }) async {
    _startLoading();
    final response = await _authRepo.resetPassword(
      email: email,
      newPassword: newPassword,
      resetToken: resetToken,
    );
    _stopLoading();
    if (response['success'] == true) {
      return true;
    } else {
      errorMsg = response['message'];
      return false;
    }
  }
}

Future<bool> isUserLoggedIn() async {
  final token = await ApiPrefHelper.getToken();
  return token != null;
}
