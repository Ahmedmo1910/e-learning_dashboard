import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teachers_dashboard/generated/l10n.dart';
import '../cubits/subject_cubit/subject_cubit.dart';
import 'widgets/subjects_screen_body.dart';
import 'package:teachers_dashboard/core/widgets/custom_app_bar.dart';

class SubjectsScreen extends StatelessWidget {
  const SubjectsScreen({super.key});
  static const String routeName = 'subjectsScreen';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SubjectCubit(),
      child: Scaffold(
        appBar: customAppBar(context, title: S.of(context).allSubjects),
        body: SubjectsScreenBody(),
      ),
    );
  }
}
