import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:teachers_dashboard/core/widgets/auth_header_widget.dart';
import 'package:teachers_dashboard/core/widgets/custom_button.dart';
import 'package:teachers_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:teachers_dashboard/features/auth/forget_password/presentation/cubit/reset_password_cubit.dart';
import 'package:teachers_dashboard/generated/l10n.dart';

// ignore: must_be_immutable
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
              headerTitle: S.of(context).forgetPassword,
              headerSubTitle: S.of(context).enterEmailSubtitle,
            ),
            //Form .............:)
            SizedBox(height: 30),
            Form(
              key: _formKey,
              child: CustomTextFormField(
                hintText:S.of(context).emailHint,
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
              text: S.of(context).continuee,
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
