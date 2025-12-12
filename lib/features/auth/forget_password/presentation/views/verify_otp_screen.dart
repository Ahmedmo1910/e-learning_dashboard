import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teachers_dashboard/core/widgets/snack_bar_helper.dart';
import 'package:teachers_dashboard/features/auth/data/auth_provider.dart';
import 'package:teachers_dashboard/features/auth/forget_password/presentation/views/reset_password_screen.dart';
import 'package:teachers_dashboard/generated/l10n.dart';

class VerifyOtpScreen extends StatefulWidget {
  final String email;

  const VerifyOtpScreen({super.key, required this.email});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final _formKey = GlobalKey<FormState>();

  String otp = "";

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).verifyOtpTitle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: S.of(context).otpLabel),
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return S.of(context).otpRequired;
                  } else {
                    return null;
                  }
                },
                onSaved: (val) => otp = val!.trim(),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: auth.isLoading
                    ? null
                    : () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          final resetToken = await auth.verifyOtp(
                            email: widget.email,
                            otp: otp,
                          );
                          if (!mounted) return;
                          if (resetToken != null) {
                            SnackBarHelper.showSnackBar(
                              context,
                              S.of(context).otpVerified,
                              Colors.green,
                            );

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ResetPasswordScreen(
                                  email: widget.email,
                                  resetToken: resetToken,
                                ),
                              ),
                            );
                          } else {
                            SnackBarHelper.showSnackBar(
                              context,
                              auth.errorMsg!,
                              Colors.red,
                            );
                          }
                        } else {
                          return;
                        }
                      },
                child: auth.isLoading
                    ? CircularProgressIndicator(color: Colors.white)
                    : Text(
                        S.of(context).verifyButton,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
