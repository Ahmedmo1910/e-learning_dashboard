import 'package:flutter/material.dart';
import 'package:teachers_dashboard/features/dashboard/presentation/views/widgets/stat_card.dart';
import 'package:teachers_dashboard/generated/l10n.dart';

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
        children:  [
          StatCard(title: S.of(context).students, value: '85'),
          StatCard(title: S.of(context).classes, value: '4'),
          StatCard(title: S.of(context).newSubmissions, value: '12'),
          StatCard(title: S.of(context).upcomingExams, value: '2'),
        ],
      ),
    );
  }
}
