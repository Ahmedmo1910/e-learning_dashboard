import 'package:flutter/material.dart';
import 'package:teachers_dashboard/core/utils/app_colors.dart';
import 'package:teachers_dashboard/features/dashboard/presentation/views/widgets/app_bar_create_exam.dart';
import 'package:teachers_dashboard/features/dashboard/presentation/views/widgets/class_field.dart';
import 'package:teachers_dashboard/features/dashboard/presentation/views/widgets/exam_title_field.dart';
import 'package:teachers_dashboard/features/dashboard/presentation/views/widgets/instructions_field.dart';
import 'package:teachers_dashboard/features/dashboard/presentation/views/widgets/url_exam_field.dart';

class CreateExamContent extends StatefulWidget {
  const CreateExamContent({super.key});

  @override
  State<CreateExamContent> createState() => _CreateExamContentState();
}

class _CreateExamContentState extends State<CreateExamContent> {
  // ignore: unused_field
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();
  final TextEditingController _instructionsController = TextEditingController();
  // ignore: unused_field
  String? _selectedClass;
  DateTime? _selectedDate;

  // ignore: unused_field
  List<String> _classes = ['Class 1', 'Class 2', 'Class 3'];

  Future<void> _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.primaryColor, // لون الزر الرئيسي
              onPrimary: Colors.white, // لون النص على الزر
              onSurface: AppColors.greyColor, // لون النص في التقويم
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        color: Colors.grey[200],
        child: SafeArea(
          child: Column(
            children: [
              appBarInCreateExam(),

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
                    /// Title inside the content
                    const Text(
                      "Exam Details",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 20),

                    ExamTitleField(),

                    const SizedBox(height: 20),

                    const Text("Class"),

                    const SizedBox(height: 6),

                    class_field(),

                    const SizedBox(height: 20),

                    GestureDetector(
                      onTap: _pickDate,
                      child: AbsorbPointer(
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Date',
                            hintText: 'Select date',
                            border: const OutlineInputBorder(),
                            suffixIcon: const Icon(Icons.calendar_today),
                            hintStyle: const TextStyle(
                              color: AppColors.greyColor,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          controller: TextEditingController(
                            text: _selectedDate != null
                                ? '${_selectedDate!.month}/${_selectedDate!.day}/${_selectedDate!.year}'
                                : '',
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    Url_Exam_Field(durationController: _durationController),

                    const SizedBox(height: 20),

                    Instructions_field(
                      instructionsController: _instructionsController,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
