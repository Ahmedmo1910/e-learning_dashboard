import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teachers_dashboard/features/auth/data/auth_repo.dart';
import 'package:teachers_dashboard/generated/l10n.dart';
part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final AuthRepo _authRepo;
  String email = '';
  String otp = '';
  String resetToken = '';
  ResetPasswordCubit(this._authRepo) : super(ResetPasswordInitial());

  void setEmail(String value) {
    email = value.trim();
  }

  Future<void> sendResetOtp() async {
    emit(ResetPasswordLoading());
    final response = await _authRepo.sendResetOtp(email: email);
    if (response["success"] == true) {
      emit(OtpSent());
    } else {
      emit(
        ResetPasswordFailure(response["message"] ?? S.current.failedToSendOtp),
      );
    }
  }

  //  verifyOtp

  Future<void> verifyOtp() async {
    emit(ResetPasswordLoading());
    final response = await _authRepo.verifyOtp(email: email, otp: otp);
    if (response["success"] == true) {
      resetToken = response['resettoken'];
      emit(OtpVerified());
    } else {
      emit(ResetPasswordFailure(response["message"] ?? S.current.otpIncorrect));
    }
  }

  //  RESET PASSWORD

  Future<void> resetPassword({required String newPassword}) async {
    emit(ResetPasswordLoading());
    final response = await _authRepo.resetPassword(
      email: email,
      newPassword: newPassword,
      resetToken: resetToken,
    );
    if (response["success"] == true) {
      emit(ResetPasswordSuccess());
    } else {
      emit(
        ResetPasswordFailure(
          response["message"] ?? S.current.resetPasswordFailed,
        ),
      );
    }
  }
}
