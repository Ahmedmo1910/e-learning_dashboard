import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teachers_dashboard/core/widgets/snack_bar_helper.dart';
import 'package:teachers_dashboard/features/auth/data/auth_provider.dart';
import 'package:teachers_dashboard/features/auth/forget_password/presentation/views/reset_password_screen.dart';

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
    final _auth = context.watch<AuthProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text("Verify OTP")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: "OTP Code"),
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return "OTP required";
                  } else {
                    return null;
                  }
                },
                onSaved: (val) => otp = val!.trim(),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: _auth.isLoading
                    ? null
                    : () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          final resetToken  = await _auth.verifyOtp(
                            email: widget.email,
                            otp: otp,
                          );
                          if (!mounted) return;
                          if(resetToken != null){
                             SnackBarHelper.showSnackBar(
                            context,
                            "OTP Verified!",
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
                            _auth.errorMsg!,
                            Colors.red,
                          );
                          }
                        } else {
                          return;
                        }
                      },
                child: _auth.isLoading
                    ? CircularProgressIndicator(color: Colors.white)
                    : const Text("Verify"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
