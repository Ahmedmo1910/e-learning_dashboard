import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teachers_dashboard/core/widgets/custom_app_bar.dart';

import '../cubit/take_attendance_cubit.dart';
import 'widgets/take_attendance_screen_body_bloc_consumer.dart';

class TakeAttendanceScreen extends StatelessWidget {
  const TakeAttendanceScreen({super.key});
  static const routeName = 'TakeAttendanceScreen';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TakeAttendanceCubit(),
      child: Scaffold(
        appBar: customAppBar(context, title: 'Attendance'),
        body: const TakeAttendanceScreenBodyBlocConsumer(),
      ),
    );
  }
}
