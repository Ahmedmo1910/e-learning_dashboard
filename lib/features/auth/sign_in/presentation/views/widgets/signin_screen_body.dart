import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:teachers_dashboard/core/utils/app_text_styles.dart';
import 'package:teachers_dashboard/core/widgets/custom_button.dart';
import 'package:teachers_dashboard/core/widgets/custom_text.dart';
import 'package:teachers_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:teachers_dashboard/core/widgets/password_field.dart';
import 'package:teachers_dashboard/features/auth/forget_password/presentation/views/forget_password_screen.dart';
import 'package:teachers_dashboard/features/auth/sign_in/presentation/cubit/cubit/signin_cubit.dart';

class SigninScreenBody extends StatefulWidget {
  const SigninScreenBody({super.key});

  @override
  State<SigninScreenBody> createState() => _SigninScreenBodyState();
}

class _SigninScreenBodyState extends State<SigninScreenBody> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(label: 'Welcome'),
              const CustomText(label: 'Back!'),
              const SizedBox(height: 32.0),
              CustomTextFormField(
                onSaved: (value) => email = value!,
                hintText: 'Username or Email',
                keyboardType: TextInputType.emailAddress,
                prefixIcon: SvgPicture.asset(
                  'assets/icons/userName.svg',
                  fit: BoxFit.scaleDown,
                  width: 24.0,
                  height: 24.0,
                ),
              ),
              const SizedBox(height: 16.0),
              PasswordField(onSaved: (value) => password = value!),
              const SizedBox(height: 16.0),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      ForgetPasswordScreen.routeName,
                    );
                  },
                  child: Text(
                    'Forgot Password?',
                    style: AppTextStyles.regular14.copyWith(
                      color: Color(0XFF858383),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32.0),
              MainButton(
                text: 'Sign In',
                hasCircularBorder: true,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<SigninCubit>().login(
                      email: email,
                      password: password,
                    );
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),
              const SizedBox(height: 32.0),
              // OrSignWith(text: 'In'),
              // const SizedBox(height: 16.0),
              // SocialAuth(
              //   text: 'Facebook',
              //   imagePath: 'facebook',
              //   color: Color(0XFF1877F2),
              //   textColor: Colors.white,
              // ),

              // SocialAuth(text: 'Google', imagePath: 'google'),
              // const SizedBox(height: 24.0),
              // const DontHaveAccountWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
