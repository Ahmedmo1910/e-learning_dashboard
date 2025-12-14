import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teachers_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:teachers_dashboard/features/exam/presentation/cubit/exam_cubit.dart';
import 'package:teachers_dashboard/features/profile/presentation/views/widgets/subject_item.dart';

import 'update_exam_dialog.dart';

class ViewExamsScreenBody extends StatefulWidget {
  const ViewExamsScreenBody({super.key});

  @override
  State<ViewExamsScreenBody> createState() => _ViewExamsScreenBodyState();
}

class _ViewExamsScreenBodyState extends State<ViewExamsScreenBody> {
  final TextEditingController _lessonIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Column(
        children: [
          CustomTextFormField(
            controller: _lessonIdController,
            labelText: "Teacher Subject Lesson ID",
            hintText: "Enter Lesson ID",
            suffixIcon: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                final id = _lessonIdController.text.trim();
                if (id.isNotEmpty) {
                  context.read<ExamCubit>().getAttachments(
                    teacherSubjectLessonId: id,
                  );
                }
              },
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: BlocBuilder<ExamCubit, ExamState>(
              builder: (context, state) {
                if (state is ExamLoaded) {
                  final attachments = state.attachments;

                  if (attachments.isEmpty) {
                    return const Center(child: Text("No exams found"));
                  }

                  return ListView.builder(
                    itemCount: attachments.length,
                    itemBuilder: (context, index) {
                      final item = attachments[index];

                      return SubjectItem(
                        name: item['attachmenttitle'] ?? 'No Title',
                        description:
                            item['attachmentdescription'] ?? 'No Description',
                        sort: '',
                        onLongPress: () {
                          context.read<ExamCubit>().deleteAttachment(
                            attachmentId: item['id'].toString(),
                          );
                        },
                        onDoubleTap: () {
                          showDialog(
                            context: context,
                            builder: (_) => BlocProvider.value(
                              value: context.read<ExamCubit>(),
                              child: UpdateExamDialog(item: item),
                            ),
                          );
                        },
                      );
                    },
                  );
                }

                return const Center(
                  child: Text("Enter Lesson ID to load exams"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
