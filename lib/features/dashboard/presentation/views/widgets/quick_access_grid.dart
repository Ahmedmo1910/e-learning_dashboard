import 'package:flutter/material.dart';
import 'package:teachers_dashboard/features/exam/presentation/views/create_exams_screen.dart';
import 'package:teachers_dashboard/features/dashboard/presentation/views/widgets/quick_access_card.dart';
import 'package:teachers_dashboard/features/lessons/presentation/view/lessons_screen.dart';
import 'package:teachers_dashboard/generated/l10n.dart';

class QuickAccessGrid extends StatelessWidget {
  const QuickAccessGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),

      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1.0,
        padding: EdgeInsets.zero,

        children: [
          QuickAccessCard(
            icon: Icons.upload_file_outlined,
            label: S.of(context).uploadLessons,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LessonsScreen()),
              );
            },
          ),
          QuickAccessCard(
            icon: Icons.assignment_outlined,
            label: S.of(context).createExam,
            onTap: () {
              Navigator.pushNamed(context, CreateExamsScreen.routeName);
            },
          ),
           QuickAccessCard(
            icon: Icons.folder_outlined,
            label: S.of(context).manageFiles,
          ),
           QuickAccessCard(
            icon: Icons.people_outline,
            label: S.of(context).studentList,
          ),
           QuickAccessCard(
            icon: Icons.bar_chart_outlined,
              label: S.of(context).grades,

          ),
           QuickAccessCard(
            icon: Icons.campaign_outlined,
            label: S.of(context).announcements,
          ),
        ],
      ),
    );
  }
}
