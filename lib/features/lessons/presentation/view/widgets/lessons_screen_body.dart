import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:teachers_dashboard/core/utils/app_text_styles.dart';
import 'package:teachers_dashboard/core/widgets/custom_button.dart';
import 'package:teachers_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:teachers_dashboard/features/lessons/presentation/cubit/lessons_cubit.dart';

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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Lessons Details", style: AppTextStyles.bold20),
              Gap(20),
              CustomTextFormField(
                hintText: 'Subject Id',
                labelText: 'Subject Id',
                onSaved: (value) => subjectId = value!,
              ),
              Gap(16),
              CustomTextFormField(
                hintText: 'Lesson Title',
                labelText: 'Lesson Title',
                onSaved: (value) => lessonTitle = value!,
              ),
              Gap(16),
              CustomTextFormField(
                hintText: 'Sort',
                onSaved: (value) => sort = int.parse(value!),
              ),
              Gap(16),
              CustomTextFormField(
                hintText: 'Lesson Description',
                labelText: 'Lesson Description',
                maxLines: 4,
                onSaved: (value) => lessonDescription = value!,
              ),
              Gap(50),
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
      ),
    );
  }
}
