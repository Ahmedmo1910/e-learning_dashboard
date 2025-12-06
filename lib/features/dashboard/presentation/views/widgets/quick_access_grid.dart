import 'package:flutter/material.dart';
import 'package:teachers_dashboard/features/dashboard/presentation/views/widgets/quick_access_card.dart';
import 'package:teachers_dashboard/features/exams/presentation/views/create_exams_screen.dart';
import 'package:teachers_dashboard/core/services/api_pref_helper.dart';

class QuickAccessGrid extends StatelessWidget {
  const QuickAccessGrid({super.key});

  Future<void> _navigateToCreateExam(BuildContext context) async {
    final token = await ApiPrefHelper.getToken();
    if (token == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Login required"), backgroundColor: Colors.red),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CreateExamScreen(teacherSubjectLessonId: "lesson_id_here"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1.0,
        padding: EdgeInsets.zero,
        children: [
          const QuickAccessCard(icon: Icons.upload_file_outlined, label: 'Upload Lessons'),
          QuickAccessCard(icon: Icons.assignment_outlined, label: 'Create Exam', onTap: () => _navigateToCreateExam(context)),
          const QuickAccessCard(icon: Icons.folder_outlined, label: 'Manage Files'),
          const QuickAccessCard(icon: Icons.people_outline, label: 'Student List'),
          const QuickAccessCard(icon: Icons.bar_chart_outlined, label: 'Grades'),
          const QuickAccessCard(icon: Icons.campaign_outlined, label: 'Announcements'),
        ],
      ),
    );
  }
}
