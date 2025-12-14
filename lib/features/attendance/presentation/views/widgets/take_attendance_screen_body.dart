import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teachers_dashboard/core/widgets/custom_button.dart';
import 'package:teachers_dashboard/core/widgets/custom_text_form_field.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../cubit/take_attendance_cubit.dart';

class TakeAttendanceScreenBody extends StatefulWidget {
  const TakeAttendanceScreenBody({super.key});

  @override
  State<TakeAttendanceScreenBody> createState() =>
      _TakeAttendanceScreenBodyState();
}

class _TakeAttendanceScreenBodyState extends State<TakeAttendanceScreenBody> {
  final studentIdCtrl = TextEditingController();
  final scheduleIdCtrl = TextEditingController();
  final notesCtrl = TextEditingController();

  bool isPresent = true;

  @override
  void dispose() {
    studentIdCtrl.dispose();
    scheduleIdCtrl.dispose();
    notesCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextFormField(
            controller: studentIdCtrl,
            hintText: 'Student ID',
            labelText: 'Student ID',
          ),
          const SizedBox(height: 12),
          CustomTextFormField(
            controller: notesCtrl,
            hintText: 'Notes',
            labelText: 'Notes',
          ),
          const SizedBox(height: 12),
          SwitchListTile(
            activeThumbColor: Colors.green,
            inactiveThumbColor: Colors.red,
            title: Text("Is Present", style: AppTextStyles.semiBold16),
            value: isPresent,
            onChanged: (value) {
              setState(() => isPresent = value);
            },
          ),
          const SizedBox(height: 24),
          MainButton(
            text: 'Submit Attendance',
            hasCircularBorder: true,
            onTap: () {
              context.read<TakeAttendanceCubit>().submitSingleAttendance(
                studentId: studentIdCtrl.text.trim(),
                scheduleId: '4ca40567-a39f-450c-8f27-a49d6baf72fe',
                isPresent: isPresent,
                notes: notesCtrl.text.trim(),
              );
            },
          ),
        ],
      ),
    );
  }
}
