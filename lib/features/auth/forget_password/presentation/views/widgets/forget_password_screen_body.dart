import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teachers_dashboard/core/widgets/auth_header_widget.dart';
import 'package:teachers_dashboard/core/widgets/custom_button.dart';
import 'package:teachers_dashboard/core/widgets/snack_bar_helper.dart';
import 'package:teachers_dashboard/features/auth/data/auth_provider.dart';
import 'package:teachers_dashboard/features/auth/forget_password/presentation/views/verify_otp_screen.dart';

class ForgetPasswordScreenBody extends StatefulWidget {
  const ForgetPasswordScreenBody({super.key});

  @override
  State<ForgetPasswordScreenBody> createState() =>
      _ForgetPasswordScreenBodyState();
}

class _ForgetPasswordScreenBodyState extends State<ForgetPasswordScreenBody> {
  final _formKey = GlobalKey<FormState>();
  String email = "";
  @override
  Widget build(BuildContext context) {
    final _auth = context.watch<AuthProvider>();
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
              child: TextFormField(
                decoration: const InputDecoration(labelText: "Email"),
                validator: (val) {
                  if (val == null || val.isEmpty) return "Email is required";

                  if (!val.contains("@")) return "Enter valid email";

                  return null;
                },
                onSaved: (val) => email = val!.trim(),
              ),
            ),
            SizedBox(height: 40),

            //Continue Bottom ..................:)
            MainButton(
              text: 'Continue',
              hasCircularBorder: true,
              onTap: _auth.isLoading
                  ? null
                  : () async {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }
                      _formKey.currentState!.save();
                      final success = await _auth.sendResetOtp(email: email);
                      if (!mounted) return;
                      if (success) {
                        SnackBarHelper.showSnackBar(
                          context,
                          "OTP sent! To $email",
                          Colors.green,
                        );

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => VerifyOtpScreen(email: email),
                          ),
                        );
                      } else {
                        SnackBarHelper.showSnackBar(
                          context,
                          _auth.errorMsg!,
                          Colors.red,
                        );
                      }
                    },
              child: _auth.isLoading
                  ? CircularProgressIndicator(color: Colors.white)
                  : const Text("Send OTP"),
            ),
          ],
        ),
      ),
    );
  }
}
