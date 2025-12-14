import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teachers_dashboard/features/dashboard/presentation/views/widgets/stat_card.dart';
import 'package:teachers_dashboard/generated/l10n.dart';
import '../../cubits/dashboard_cubit/dashboard_cubit.dart';

class StatsGrid extends StatelessWidget {
  const StatsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 2,
            children: [
              StatCard(
                title: S.of(context).students,
                value: state.studentsCount.toString(),
              ),
              StatCard(
                title: S.of(context).classes,
                value: state.classesCount.toString(),
              ),
              StatCard(title: S.of(context).newSubmissions, value: '12'),
              StatCard(
                title: S.of(context).upcomingExams,
                value: state.attachmentsCount.toString(),
              ),
            ],
          ),
        );
      },
    );
  }
}
