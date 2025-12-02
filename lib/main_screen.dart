import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:teachers_dashboard/core/utils/app_colors.dart';
import 'package:teachers_dashboard/core/utils/app_text_styles.dart';
import 'features/dashboard/presentation/views/dashboard_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  static const String routeName = 'main';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        controller: _controller,
        tabs: [
          PersistentTabConfig(
            screen:DashboardScreen(),
            item: ItemConfig(
              icon: const Icon(Icons.dashboard),
              title: "Dashboard",
              textStyle: AppTextStyles.medium12,
              activeForegroundColor: AppColors.primaryColor,
            ),
          ),
          PersistentTabConfig(
            screen: Center(child: Text('Schedule Screen')),
            item: ItemConfig(
              icon: const Icon(Icons.schedule),
              title: "Schedule",
              textStyle: AppTextStyles.medium12,
              activeForegroundColor: AppColors.primaryColor,
            ),
          ),
          PersistentTabConfig(
            screen: Center(child: Text('Profile Screen')),
            item: ItemConfig(
              icon: const Icon(Icons.person),
              title: " Profile",
              textStyle: AppTextStyles.medium12,
              activeForegroundColor: AppColors.primaryColor,
            ),
          ),
        ],
        navBarBuilder: (navBarConfig) =>
            Style6BottomNavBar(navBarConfig: navBarConfig),
      ),
    );
  }
}
