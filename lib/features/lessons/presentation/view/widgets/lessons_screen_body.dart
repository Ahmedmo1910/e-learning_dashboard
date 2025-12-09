import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teachers_dashboard/core/widgets/custom_button.dart';
import 'package:teachers_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:teachers_dashboard/features/dashboard/presentation/views/widgets/app_bar_create_exam.dart';
import 'package:teachers_dashboard/features/lessons/presentation/cubit/lessons_cubit.dart';

// ignore: must_be_immutable
class LessonsScreenBody extends StatefulWidget {
  const LessonsScreenBody({super.key});

  @override
  State<LessonsScreenBody> createState() => _LessonsScreenBodyState();
}

final GlobalKey<FormState> formKey = GlobalKey<FormState>();
AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
late String lessonTitle, lessonDescription, subjectId;
late int sort;

class _LessonsScreenBodyState extends State<LessonsScreenBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.grey[200],
        child: SafeArea(
          child: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              children: [
                appBarInCreateExam(
                  screenName: 'Create New Lesson',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),

                Divider(),

                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Lessons Details",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 20),

                      const Text(
                        "Subject Id",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 3),
                      CustomTextFormField(
                        hintText: 'Subject Id',
                        onSaved: (value) => subjectId == value!,
                      ),

                      const SizedBox(height: 20),

                      const Text(
                        "Lesson Title",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 3),
                      CustomTextFormField(
                        hintText: 'Lesson Title',
                        onSaved: (value) => lessonTitle == value!,
                      ),

                      const SizedBox(height: 20),

                      const Text(
                        "Lesson Description",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 3),
                      CustomTextFormField(
                        hintText: 'Lesson Description',
                        maxLines: 5,
                        onSaved: (value) => lessonDescription == value!,
                      ),

                      const SizedBox(height: 20),

                      const Text(
                        "Sort",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 3),
                      CustomTextFormField(
                        hintText: 'Sort',
                        maxLines: 5,
                        onSaved: (value) => sort.toString() == value!,
                      ),

                      const SizedBox(height: 20),

                      MainButton(
                        text: 'Create Lesson',
                        hasCircularBorder: true,
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            context.read<LessonsCubit>().createLesson(
                              lessontitle: lessonTitle,
                              lessondescription: lessonDescription,
                              sort: sort,
                              teachersubjectid: subjectId,
                            );
                            formKey.currentState!.reset();
                          } else {
                            setState(() {
                              autovalidateMode = AutovalidateMode.always;
                            });
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
