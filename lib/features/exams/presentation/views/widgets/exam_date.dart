import 'package:flutter/material.dart';
import 'package:teachers_dashboard/core/utils/app_colors.dart';
import 'package:teachers_dashboard/core/widgets/custom_text_form_field.dart';

class ExamDateDurationField extends StatefulWidget {
  final TextEditingController dateController;
  final TextEditingController durationController;

  const ExamDateDurationField({
    super.key,
    required this.dateController,
    required this.durationController,
  });

  @override
  State<ExamDateDurationField> createState() => _ExamDateDurationFieldState();
}

class _ExamDateDurationFieldState extends State<ExamDateDurationField> {
  Future<void> _pickDate() async {
    DateTime now = DateTime.now();

    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.primaryColor,
              onPrimary: Colors.white,
              onSurface: AppColors.greyColor,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      widget.dateController.text = "${picked.month}/${picked.day}/${picked.year}";
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: _pickDate,
            child: AbsorbPointer(
              child: CustomTextFormField(
                controller: widget.dateController,
                hintText: "Select date",
                suffixIcon: const Icon(
                  Icons.calendar_today,
                  color: AppColors.greyColor,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: CustomTextFormField(
            controller: widget.durationController,
            hintText: "e.g, 60 ",
            keyboardType: TextInputType.number,
            suffixIcon: const Icon(
              Icons.timer,
              color: AppColors.greyColor,
            ),
          ),
        ),
      ],
    );
  }
}
