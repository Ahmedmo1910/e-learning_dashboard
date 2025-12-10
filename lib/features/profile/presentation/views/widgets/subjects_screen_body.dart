import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:teachers_dashboard/features/profile/presentation/cubits/subject_cubit/subject_cubit.dart';

import 'subject_item.dart';

class SubjectsScreenBody extends StatefulWidget {
  const SubjectsScreenBody({super.key});

  @override
  State<SubjectsScreenBody> createState() => _SubjectsScreenBodyState();
}

class _SubjectsScreenBodyState extends State<SubjectsScreenBody> {
  @override
  void initState() {
    context.read<SubjectCubit>().getTeacherSubjects();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubjectCubit, SubjectState>(
      builder: (context, state) {
        if (state is SubjectLoading) {
          return Center(
            child: Lottie.asset(
              'assets/animations/loading.json',
              width: 250,
              height: 250,
            ),
          );
        }

        if (state is SubjectFailure) {
          return Center(child: Text(state.errorMessage));
        }

        if (state is SubjectSuccess) {
          final subjects = state.subjects; 

          return ListView.builder(
            itemCount: subjects.length,
            itemBuilder: (context, index) {
              final item = subjects[index];
              return SubjectItem(
                name: item['name'] ?? 'No Name',
                id: item['teachersubjectid'] ?? 'No ID',
              );
            },
          );
        }

        return const SizedBox();
      },
    );
  }
}
