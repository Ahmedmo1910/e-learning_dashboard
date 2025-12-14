import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/take_attendance_cubit.dart';
import 'take_attendance_screen_body.dart';

class TakeAttendanceScreenBodyBlocConsumer extends StatelessWidget {
  const TakeAttendanceScreenBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TakeAttendanceCubit, TakeAttendanceState>(
      listener: (context, state) {
        if (state is TakeAttendanceSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Attendance sent successfully")),
          );
        } else if (state is TakeAttendanceFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            const TakeAttendanceScreenBody(),

            if (state is TakeAttendanceLoading)
              const Center(child: CircularProgressIndicator()),
          ],
        );
      },
    );
  }
}
