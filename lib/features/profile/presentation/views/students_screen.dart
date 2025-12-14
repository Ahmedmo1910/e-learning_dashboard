import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teachers_dashboard/core/widgets/custom_app_bar.dart';
import 'package:teachers_dashboard/generated/l10n.dart';
import '../cubits/student_cubit/student_cubit.dart';
import 'widgets/students_screen_body.dart';

class StudentsScreen extends StatelessWidget {
  const StudentsScreen({super.key});
  static const routeName = 'studentsScreen';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StudentCubit(),
      child: Scaffold(
        appBar: customAppBar(context, title: S.of(context).students),
        body: StudentsScreenBody(),
      ),
    );
  }
}
