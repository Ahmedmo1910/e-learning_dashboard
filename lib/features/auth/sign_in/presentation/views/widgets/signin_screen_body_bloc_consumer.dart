import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teachers_dashboard/core/widgets/custom_progress_hud.dart';
import 'package:teachers_dashboard/core/widgets/snack_bar_helper.dart';
import 'package:teachers_dashboard/features/auth/sign_in/presentation/cubit/cubit/signin_cubit.dart';
import 'package:teachers_dashboard/features/auth/sign_in/presentation/views/widgets/signin_screen_body.dart';
import 'package:teachers_dashboard/generated/l10n.dart';
import 'package:teachers_dashboard/main_screen.dart';

class SigninScreenBodyBlocConsumer extends StatelessWidget {
  const SigninScreenBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninSuccess) {
          SnackBarHelper.showSnackBar(
            context,
            S.of(context).loginSuccess,
            Colors.green,
          );
          Navigator.pushReplacementNamed(context, MainScreen.routeName);
        } else if (state is SigninFailure) {
          SnackBarHelper.showSnackBar(
            context,
            S.of(context).loginFailed,
            Colors.red,
          );
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is SigninLoading ? true : false,
          child: const SigninScreenBody(),
        );
      },
    );
  }
}
