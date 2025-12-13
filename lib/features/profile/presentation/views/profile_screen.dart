import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/profile_cubit/profile_cubit.dart';
import 'widgets/profile_container_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..getProfile(),
      child: Container(
        color: const Color(0xffdfecf5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [const ProfileContainerWidget()],
        ),
      ),
    );
  }
}
