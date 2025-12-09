import 'package:flutter/material.dart';
import 'widgets/profile_container_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffdfecf5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [const ProfileContainerWidget()],
      ),
    );
  }
}
