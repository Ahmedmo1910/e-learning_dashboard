import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../../cubits/student_cubit/student_cubit.dart';
import 'students_card_item.dart';


class StudentsScreenBody extends StatefulWidget {
  const StudentsScreenBody({super.key});

  @override
  State<StudentsScreenBody> createState() => _StudentsScreenBodyState();
}

class _StudentsScreenBodyState extends State<StudentsScreenBody> {
  @override
  void initState() {
    context.read<StudentCubit>().getStudents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
      builder: (context, state) {
        if (state is StudentLoading) {
          return Center(
            child: Lottie.asset(
              'assets/animations/loading.json',
              width: 250,
              height: 250,
            ),
          );
        }

        if (state is StudentFailure) {
          return Center(child: Text(state.errorMessage));
        }

        if (state is StudentSuccess) {
          final students = state.students;

          return ListView.builder(
            itemCount: students.length,
            itemBuilder: (context, index) {
              final item = students[index];
              return Padding(
                padding: const EdgeInsets.only(top: 10),
                child: StudentsCardItem(
                  fullName: item['fullname'] ?? 'No Name',
                  email: item['email'] ?? 'No Email',
                  phone: item['phone'] ?? 'No Phone',
                  userId: item['id'] ?? 'No ID',
                ),
              );
            },
          );
        }

        return const SizedBox();
      },
    );
  }
}
