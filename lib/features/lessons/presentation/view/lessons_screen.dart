import 'package:flutter/material.dart';
import 'package:teachers_dashboard/core/widgets/custom_button.dart';
import 'package:teachers_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:teachers_dashboard/features/dashboard/presentation/views/widgets/app_bar_create_exam.dart';

class LessonsScreen extends StatelessWidget {
  const LessonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        color: Colors.grey[200],
        child: SafeArea(
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
                      "Lesson Title",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 3),
                    CustomTextFormField(hintText: 'Lesson Title'),

                    const SizedBox(height: 20),

                    const Text(
                      "Lesson URL",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 3),
                    CustomTextFormField(hintText: 'Lesson URL'),

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
                    ),

                    const SizedBox(height: 20),

                    MainButton(
                      text: 'Create Lesson',
                      hasCircularBorder: true,
                      onTap: () {},
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
