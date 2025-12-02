part of 'signin_cubit.dart';

sealed class SigninState {}

final class SigninInitial extends SigninState {}

class SigninLoading extends SigninState {}

class SigninSuccess extends SigninState {}

class SigninFailure extends SigninState {
  final String errorMsg;
  SigninFailure(this.errorMsg);
}

// Reset Password Flow States
// class OtpSent extends SigninState {}

// class OtpVerified extends SigninState {
//   final String resetToken;
//   OtpVerified(this.resetToken);
// }

// class PasswordResetSuccess extends SigninState {}
