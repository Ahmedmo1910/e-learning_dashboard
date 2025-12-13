import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:teachers_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:teachers_dashboard/features/profile/presentation/cubits/lesson_cubit/lesson_cubit.dart';
import 'package:teachers_dashboard/generated/l10n.dart';

import 'subject_item.dart';

class LessonScreenBody extends StatefulWidget {
  const LessonScreenBody({super.key});

  @override
  State<LessonScreenBody> createState() => _LessonScreenBodyState();
}

class _LessonScreenBodyState extends State<LessonScreenBody> {
  final TextEditingController _idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
      child: Column(
        children: [
          CustomTextFormField(
            controller: _idController,
            labelText: S.of(context).teacherSubjectId,
            hintText: S.of(context).enterTeacherSubjectId,
            suffixIcon: IconButton(
              onPressed: () {
                final id = _idController.text.trim();
                if (id.isNotEmpty) {
                  context.read<LessonCubit>().getTeacherSubjectLessons(
                    teacherSubjectId: id,
                  );
                }
              },
              icon: const Icon(Icons.search),
            ),
          ),
          const SizedBox(height: 40),
          const SizedBox(height: 20),
          Expanded(
            child: BlocBuilder<LessonCubit, LessonState>(
              builder: (context, state) {
                if (state is LessonLoading) {
                  return Center(
                    child: Lottie.asset(
                      'assets/animations/loading.json',
                      width: 200,
                      height: 200,
                    ),
                  );
                }

                if (state is LessonFailure) {
                  return Center(
                    child: Text(
                      state.errorMessage,
                      style: TextStyle(color: Colors.red),
                    ),
                  );
                }

                if (state is LessonSuccess) {
                  final lessons = state.lessons;

                  return ListView.builder(
                    itemCount: lessons.length,
                    itemBuilder: (context, index) {
                      final item = lessons[index];
                      return SubjectItem(
                        name: item['lessontitle'] ?? 'No Name',
                        id: item['teachersubjectlessonid'] ?? 'No ID',
                        sort: item['sort'].toString(),
                      );
                    },
                  );
                }

                return Center(child: Text(S.of(context).enterIdToLoadLessons));
              },
            ),
          ),
        ],
      ),
    );
  }
}
