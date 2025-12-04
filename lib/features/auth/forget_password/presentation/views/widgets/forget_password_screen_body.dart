import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:teachers_dashboard/core/widgets/auth_header_widget.dart';
import 'package:teachers_dashboard/core/widgets/custom_button.dart';
import 'package:teachers_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:teachers_dashboard/features/auth/forget_password/presentation/cubit/reset_password_cubit.dart';

class ForgetPasswordScreenBody extends StatelessWidget {
  ForgetPasswordScreenBody({super.key});

  final _formKey = GlobalKey<FormState>();
  late String email;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ResetPasswordCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Header Screen .............:)
            AuthHeaderWidget(
              headerTitle: 'Forget Password ?',
              headerSubTitle:
                  "Enter your email address and\nwe’ll send a confirmation code",
            ),
            //Form .............:)
            SizedBox(height: 30),
            Form(
              key: _formKey,
              child: CustomTextFormField(
                hintText: "Email",
                onSaved: (val) => email = val!.trim(),
                prefixIcon: SvgPicture.asset(
                  'assets/icons/email.svg',
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            SizedBox(height: 40),

            //Continue Bottom ..................:)
            MainButton(
              text: 'Continue',
              hasCircularBorder: true,
              onTap: () {
                if (!_formKey.currentState!.validate()) return;
                _formKey.currentState!.save();
                cubit.setEmail(email);
                cubit.sendResetOtp();
              },
            ),
          ],
        ),
      ),
    );
  }
}
