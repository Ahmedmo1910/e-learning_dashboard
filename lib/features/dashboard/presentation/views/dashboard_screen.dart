import 'package:flutter/material.dart';
import 'package:teachers_dashboard/features/dashboard/presentation/views/widgets/custom_app_bar.dart';
import 'package:teachers_dashboard/features/dashboard/presentation/views/widgets/quick_access_grid.dart';
import 'package:teachers_dashboard/features/dashboard/presentation/views/widgets/stats_grid.dart';
import 'package:teachers_dashboard/generated/l10n.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            CustomAppBar(),
            StatsGrid(),
            SizedBox(height: 20),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                 S.of(context).quickAccess,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            QuickAccessGrid(),

            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
