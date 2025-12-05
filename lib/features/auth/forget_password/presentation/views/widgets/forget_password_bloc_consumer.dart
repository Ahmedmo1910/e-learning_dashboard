import 'package:flutter/material.dart';
import 'package:teachers_dashboard/core/widgets/snack_bar_helper.dart';
import '../../cubit/reset_password_cubit.dart';
import 'forget_password_screen_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teachers_dashboard/core/widgets/custom_progress_hud.dart';
import 'otp_dialog.dart';
import 'reset_password_dialog.dart';

class ForgetPasswordBlocConsumer extends StatelessWidget {
  const ForgetPasswordBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if (state is OtpSent) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => BlocProvider.value(
              value: context.read<ResetPasswordCubit>(),
              child: OtpDialog(),
            ),
          );
        }

        if (state is OtpVerified) {
          Navigator.pop(context);
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => BlocProvider.value(
              value: context.read<ResetPasswordCubit>(),
              child: ResetPasswordDialog(),
            ),
          );
        }

        if (state is ResetPasswordSuccess) {
          Navigator.pop(context);
          Navigator.pop(context);
          SnackBarHelper.showSnackBar(
            context,
            'Password reset successfully',
            Colors.green,
          );
        }

        if (state is ResetPasswordFailure) {
          SnackBarHelper.showSnackBar(context, state.errorMsg, Colors.red);
        }
      },

      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is ResetPasswordLoading,
          child: ForgetPasswordScreenBody(),
        );
      },
    );
  }
}
