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
import 'package:teachers_dashboard/generated/l10n.dart';

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
              Text(S.of(context).examDetails, style: AppTextStyles.bold20),
              Gap(20),
              CustomTextFormField(
                labelText:  S.of(context).subjectId,
                hintText: S.of(context).subjectId,
                onSaved: (value) => subjectId = value!,
              ),
              Gap(16),
              CustomTextFormField(
                labelText: S.of(context).examTitle,
                hintText:  S.of(context).examTitleHint,
                onSaved: (value) => examTitle = value!,
              ),
              Gap(16),
              DatePickerField(
                onDateChanged: (date) {
                  this.date = date.toString();
                },
                labelText:  S.of(context).date,
              ),
              Gap(16),
              CustomTextFormField(
                labelText:  S.of(context).examUrl,
                hintText:  S.of(context).examUrlHint,
                onSaved: (value) => examUrl = value!,
              ),
              Gap(16),
              CustomTextFormField(
                hintText: S.of(context).examInstructionsHint,
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
                     S.of(context).viewExams,
                    style: AppTextStyles.regular16.copyWith(
                      color: AppColors.primaryColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              Gap(50),
              MainButton(
                text: S.of(context).createExam,
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
