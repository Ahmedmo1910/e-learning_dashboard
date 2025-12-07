import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/create_exam_bloc_consumer.dart';
import 'package:teachers_dashboard/core/widgets/custom_app_bar.dart';
import 'package:teachers_dashboard/features/exam/presentation/cubit/exam_cubit.dart';

class CreateExamsScreen extends StatelessWidget {
  const CreateExamsScreen({super.key});
  static const String routeName = 'CreateExamsScreen';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExamCubit(),
      child: Scaffold(
        appBar: customAppBar(context, title: 'Create New Exam'),
        body: const CreateExamBlocConsumer(),
      ),
    );
  }
}
