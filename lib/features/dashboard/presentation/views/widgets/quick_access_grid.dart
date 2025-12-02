import 'package:flutter/material.dart';
import 'package:teachers_dashboard/features/dashboard/presentation/views/widgets/quick_access_card.dart';

class QuickAccessGrid extends StatelessWidget {
  const QuickAccessGrid({super.key});

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

        children: const [
          QuickAccessCard(
            icon: Icons.upload_file_outlined,
            label: 'Upload Lessons',
          ),
          QuickAccessCard(
            icon: Icons.assignment_outlined,
            label: 'Create Exam',
          ),
          QuickAccessCard(icon: Icons.folder_outlined, label: 'Manage Files'),
          QuickAccessCard(icon: Icons.people_outline, label: 'Student List'),
          QuickAccessCard(icon: Icons.bar_chart_outlined, label: 'Grades'),
          QuickAccessCard(
            icon: Icons.campaign_outlined,
            label: 'Announcements',
          ),
        ],
      ),
    );
  }
}
