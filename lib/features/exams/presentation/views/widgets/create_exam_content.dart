import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teachers_dashboard/core/utils/app_text_styles.dart';
import 'package:teachers_dashboard/core/widgets/custom_button.dart';
import 'package:teachers_dashboard/features/exams/presentation/cubit/cubit/exam_cubit.dart';
import 'package:teachers_dashboard/features/exams/presentation/cubit/cubit/exam_state.dart';
import 'package:teachers_dashboard/features/exams/presentation/views/widgets/app_bar_create_exam.dart';
import 'package:teachers_dashboard/features/exams/presentation/views/widgets/class_field.dart';
import 'package:teachers_dashboard/features/exams/presentation/views/widgets/exam_date.dart';
import 'package:teachers_dashboard/features/exams/presentation/views/widgets/exam_title_field.dart';
import 'package:teachers_dashboard/features/exams/presentation/views/widgets/instructions_field.dart';
import 'package:teachers_dashboard/features/exams/presentation/views/widgets/url_exam_field.dart';
class CreateExamContent extends StatefulWidget {
  final String teacherSubjectLessonId;

  const CreateExamContent({super.key, required this.teacherSubjectLessonId});

  @override
  State<CreateExamContent> createState() => _CreateExamContentState();
}

class _CreateExamContentState extends State<CreateExamContent> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _urlController = TextEditingController();
  final TextEditingController _instructionsController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String? _selectedClass;

  @override
  void dispose() {
    _titleController.dispose();
    _urlController.dispose();
    _instructionsController.dispose();
    _dateController.dispose();
    _durationController.dispose();
    super.dispose();
  }

  void _handleSave() {
    if (_formKey.currentState?.validate() ?? false) {
      if (_selectedClass == null) {
        _showErrorSnackBar("Please select a class");
        return;
      }

      context.read<ExamCubit>().createExam(
        teacherSubjectLessonId: widget.teacherSubjectLessonId,
        attachment: "exam",
        attachmentUrl: _urlController.text.trim(),
        attachmentTitle: _titleController.text.trim(),
        attachmentDescription: _instructionsController.text.trim(),
      );
    }
  }

  void _showErrorSnackBar(String message) => ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message), backgroundColor: Colors.red, behavior: SnackBarBehavior.floating),
  );

  void _showSuccessSnackBar(String message) => ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message), backgroundColor: Colors.green, behavior: SnackBarBehavior.floating),
  );

  @override
  Widget build(BuildContext context) {
    return BlocListener<ExamCubit, ExamState>(
      listener: (context, state) {
        if (state.isSuccess) {
          _showSuccessSnackBar("Exam created successfully!");
          Navigator.pop(context);
        } else if (state.errorMessage.isNotEmpty) {
          _showErrorSnackBar(state.errorMessage);
        }
      },
      child: BlocBuilder<ExamCubit, ExamState>(
        builder: (context, state) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              color: Colors.grey[200],
              child: SafeArea(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      AppBarCreateExam(isLoading: state.isLoading),
                      const Divider(),
                      Container(
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Exam Details", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 20),
                            const Text("Exam Title", style: AppTextStyles.semiBold16),
                            ExamTitleField(controller: _titleController),
                            const SizedBox(height: 20),
                            const Text("Class", style: AppTextStyles.semiBold16),
                            const SizedBox(height: 6),
                            ClassField(selectedClass: _selectedClass, onChanged: (value) => setState(() => _selectedClass = value)),
                            const SizedBox(height: 20),
                            const Text("Date & Duration", style: AppTextStyles.semiBold16),
                            ExamDateDurationField(dateController: _dateController, durationController: _durationController),
                            const SizedBox(height: 20),
                            const Text("Exam Link", style: AppTextStyles.semiBold16),
                            UrlExamField(controller: _urlController),
                            const SizedBox(height: 20),
                            const Text("Instructions", style: AppTextStyles.semiBold16),
                            InstructionsField(controller: _instructionsController),
                            const SizedBox(height: 20),
                            MainButton(text: "Create Exam", onTap: _handleSave, hasCircularBorder: true),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
