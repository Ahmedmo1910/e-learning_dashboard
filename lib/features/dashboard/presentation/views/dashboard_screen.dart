import 'package:flutter/material.dart';
import 'package:teachers_dashboard/features/dashboard/presentation/views/widgets/custom_app_bar.dart';
import 'package:teachers_dashboard/features/dashboard/presentation/views/widgets/quick_access_grid.dart';
import 'package:teachers_dashboard/features/dashboard/presentation/views/widgets/stats_grid.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            CustomAppBar(),
            StatsGrid(),
            SizedBox(height: 20),

            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Quick Access',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),

            QuickAccessGrid(),

            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
