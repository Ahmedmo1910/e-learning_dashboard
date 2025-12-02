import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teachers_dashboard/core/widgets/snack_bar_helper.dart';
import 'package:teachers_dashboard/features/auth/data/auth_provider.dart';
import 'package:teachers_dashboard/features/auth/sign_in/presentation/views/signin_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  final String email;
  final String resetToken;

  const ResetPasswordScreen({
    super.key,
    required this.email,
    required this.resetToken,
  });

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  String newPassword = "";

  @override
  Widget build(BuildContext context) {
    final _auth = context.watch<AuthProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text("Reset Password")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(labelText: "New Password"),
                validator: (val) {
                  if (val == null || val.isEmpty) return "Password required";

                  if (val.length < 8) return "Required 8 characters or higher";

                  return null;
                },
                onSaved: (val) => newPassword = val!.trim(),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: _auth.isLoading
                    ? null
                    : () async {
                        if (!_formKey.currentState!.validate()) return;

                        _formKey.currentState!.save();

                        final success = await _auth.resetPassword(
                          email: widget.email,
                          resetToken: widget.resetToken,
                          newPassword: newPassword,
                        );

                        if (!mounted) return;

                        if (success) {
                          SnackBarHelper.showSnackBar(
                            context,
                            "Password Changed Successfully",
                            Colors.green,
                          );

                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (_) => SigninScreen()),
                            (route) => false,
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
                    : const Text("Reset Password"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
