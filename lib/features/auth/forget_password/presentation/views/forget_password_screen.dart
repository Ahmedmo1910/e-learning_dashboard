import 'package:flutter/material.dart';
import 'package:teachers_dashboard/core/widgets/custom_app_bar.dart';
import 'widgets/forget_password_screen_body.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static const String routeName = 'forgetPasswordScreen';
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: ForgetPasswordScreenBody(),
    );
  }
}
