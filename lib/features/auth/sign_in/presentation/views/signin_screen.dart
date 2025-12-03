import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/signin_screen_body_bloc_consumer.dart';
import 'package:teachers_dashboard/features/auth/data/auth_repo.dart';
import 'package:teachers_dashboard/features/auth/sign_in/presentation/cubit/cubit/signin_cubit.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});
  static const String routeName = 'signin';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(AuthRepo()),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(body: SafeArea(child: SigninScreenBodyBlocConsumer())),
      ),
    );
  }
}
