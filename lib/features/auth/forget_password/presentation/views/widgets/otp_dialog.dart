import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';
import 'package:teachers_dashboard/core/utils/app_colors.dart';
import 'package:teachers_dashboard/core/utils/app_text_styles.dart';
import '../../cubit/reset_password_cubit.dart';

class OtpDialog extends StatelessWidget {
  final TextEditingController otpController = TextEditingController();

  OtpDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ResetPasswordCubit>();
    final defaultPinTheme = PinTheme(
      width: 52,
      height: 52,
      textStyle:AppTextStyles.bold20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.greyColor),
      ),
    );

    return AlertDialog(
      title: Text(
        'Enter OTP',
        style: AppTextStyles.semiBold20.copyWith(color: AppColors.primaryColor),
      ),
      content: BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
        builder: (context, state) {
          final isLoading = state is ResetPasswordLoading;

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Pinput(
                length: 6,
                controller: otpController,
                keyboardType: TextInputType.number,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    border: Border.all(color: AppColors.primaryColor),
                  ),
                ),

                onCompleted: (value) {
                  cubit.otp = value;
                  cubit.verifyOtp();
                },
              ),
              const SizedBox(height: 16),

              if (isLoading)
                Lottie.asset(
                  'assets/animations/loading.json',
                  width: 150,
                  height: 150,
                ),
            ],
          );
        },
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            'Cancel',
            style: AppTextStyles.medium16.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            cubit.otp = otpController.text;
            cubit.verifyOtp();
          },
          child:  Text(
            'Verify',
            style: AppTextStyles.medium16.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
