import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teachers_dashboard/core/utils/app_colors.dart';
import 'package:teachers_dashboard/core/utils/app_text_styles.dart';
import 'package:teachers_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:teachers_dashboard/features/lessons/presentation/cubit/lessons_cubit.dart';
import 'package:teachers_dashboard/features/lessons/presentation/cubit/lessons_state.dart';
import 'package:teachers_dashboard/features/profile/presentation/views/widgets/subject_item.dart';

import 'update_lesson_dialog.dart';

class ViewLessonsScreenBody extends StatefulWidget {
  const ViewLessonsScreenBody({super.key});

  @override
  State<ViewLessonsScreenBody> createState() => _ViewLessonsScreenBodyState();
}

class _ViewLessonsScreenBodyState extends State<ViewLessonsScreenBody> {
  final TextEditingController _idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
      child: Column(
        children: [
          CustomTextFormField(
            controller: _idController,
            labelText: "Teacher Subject ID",
            hintText: "Enter Teacher Subject ID",
            suffixIcon: IconButton(
              onPressed: () {
                final id = _idController.text.trim();
                if (id.isNotEmpty) {
                  context.read<LessonsCubit>().getTeacherSubjectLessons(
                    teacherSubjectId: id,
                  );
                }
              },
              icon: const Icon(Icons.search),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: BlocBuilder<LessonsCubit, LessonsState>(
              builder: (context, state) {
                if (state is LessonsLoaded) {
                  final lessons = state.lessons;

                  if (lessons.isEmpty) {
                    return const Center(child: Text("No lessons found"));
                  }

                  return ListView.builder(
                    itemCount: lessons.length,
                    itemBuilder: (context, index) {
                      final item = lessons[index];
                      return SubjectItem(
                        name: item['lessontitle'] ?? 'No Title',
                        description:
                            item['lessondescription'] ?? 'No Description',
                        sort: item['sort'].toString(),
                        onLongPress: () {
                          context.read<LessonsCubit>().deleteLesson(
                            lessonId: item['id'].toString(),
                            teacherSubjectId: _idController.text.trim(),
                          );
                        },
                        onDoubleTap: () {
                          showDialog(
                            context: context,
                            builder: (_) => BlocProvider.value(
                              value: context.read<LessonsCubit>(),
                              child: UpdateLessonDialog(
                                item: item,
                                teacherSubjectId: _idController.text.trim(),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                }

                return const Center(
                  child: Text("Enter a Teacher Subject ID to load lessons"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
