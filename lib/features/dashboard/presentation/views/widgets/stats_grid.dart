import 'package:flutter/material.dart';
import 'package:teachers_dashboard/features/dashboard/presentation/views/widgets/stat_card.dart';

class StatsGrid extends StatelessWidget {
  const StatsGrid({super.key});

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
        childAspectRatio: 2,
        children: const [
          StatCard(title: 'Students', value: '85'),
          StatCard(title: 'Classes', value: '4'),
          StatCard(title: 'New Submissions', value: '12'),
          StatCard(title: 'Upcoming Exams', value: '2'),
        ],
      ),
    );
  }
}
