import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:teachers_dashboard/core/utils/app_colors.dart';
import 'package:teachers_dashboard/core/utils/app_text_styles.dart';
import 'package:teachers_dashboard/core/widgets/custom_button.dart';
import 'package:teachers_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:teachers_dashboard/features/exam/presentation/cubit/exam_cubit.dart';
import 'package:teachers_dashboard/features/exam/presentation/views/view_exams_screen.dart';
import 'package:teachers_dashboard/features/exam/presentation/views/widgets/date_picker_field.dart';

class CreateExamsScreenBody extends StatefulWidget {
  const CreateExamsScreenBody({super.key});

  @override
  State<CreateExamsScreenBody> createState() => _CreateExamsScreenBodyState();
}

class _CreateExamsScreenBodyState extends State<CreateExamsScreenBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String subjectId, examTitle, date, examUrl, instructions;

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
              Text("Exam Details", style: AppTextStyles.bold20),
              Gap(20),
              CustomTextFormField(
                labelText: "Subject ID",
                hintText: "Subject ID",
                onSaved: (value) => subjectId = value!,
              ),
              Gap(16),
              CustomTextFormField(
                labelText: "Exam Title",
                hintText: "e.g., Mid-Term Biology Exam",
                onSaved: (value) => examTitle = value!,
              ),
              Gap(16),
              DatePickerField(
                onDateChanged: (date) {
                  this.date = date.toString();
                },
                labelText: 'Date',
              ),
              Gap(16),
              CustomTextFormField(
                labelText: "Exam URL",
                hintText: "e.g., https://examplatform.com/exam123",
                onSaved: (value) => examUrl = value!,
              ),
              Gap(16),
              CustomTextFormField(
                hintText: "Instructions for the exam",
                onSaved: (value) => instructions = value!,
                maxLines: 4,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, ViewExamsScreen.routeName);
                  },
                  child: Text(
                    "View Exams",
                    style: AppTextStyles.regular16.copyWith(
                      color: AppColors.primaryColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              Gap(50),
              MainButton(
                text: "Create Exam",
                hasCircularBorder: true,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<ExamCubit>().createAttachment(
                      teacherSubjectLessonId: subjectId,
                      attachment: date,
                      attachmentUrl: examUrl,
                      attachmentTitle: examTitle,
                      attachmentDescription: instructions,
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
