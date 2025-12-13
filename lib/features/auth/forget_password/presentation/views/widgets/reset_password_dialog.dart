import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:teachers_dashboard/core/utils/app_colors.dart';
import 'package:teachers_dashboard/core/utils/app_text_styles.dart';
import 'package:teachers_dashboard/generated/l10n.dart';
import '../../cubit/reset_password_cubit.dart';

class ResetPasswordDialog extends StatelessWidget {
  final TextEditingController passwordController = TextEditingController();

  ResetPasswordDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        S.of(context).newPassword,
        style: AppTextStyles.semiBold20.copyWith(color: AppColors.primaryColor),
      ),
      content: BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
        builder: (context, state) {
          final isLoading = state is ResetPasswordLoading;

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primaryColor),
                  ),
                  labelText: S.of(context).newPassword,
                  labelStyle: TextStyle(color: AppColors.greyColor),
                ),
                cursorColor: AppColors.primaryColor,
                style: AppTextStyles.medium16,
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
            S.of(context).cancel,

            style: AppTextStyles.medium14.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            context.read<ResetPasswordCubit>().resetPassword(
              newPassword: passwordController.text.trim(),
            );
          },
          child: Text(
            S.of(context).change,
            style: AppTextStyles.medium14.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
