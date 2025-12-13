import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:teachers_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:teachers_dashboard/generated/l10n.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key, this.onSaved, this.hintText = 'Password'});
  final void Function(String?)? onSaved;
  final String hintText;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      onSaved: (value) {
        if (widget.onSaved != null) {
          widget.onSaved!(value);
        }
      },
      hintText: S.of(context).password, 
      obscureText: obscureText,
      prefixIcon: SvgPicture.asset(
        'assets/icons/password.svg',
        fit: BoxFit.scaleDown,
        width: 24.0,
        height: 24.0,
      ),
      suffixIcon: GestureDetector(
        onTap: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
        child: obscureText
            ? const Icon(Icons.visibility_off, color: Colors.grey, size: 24.0)
            : const Icon(Icons.visibility, color: Colors.grey, size: 24.0),
      ),
    );
  }
}
