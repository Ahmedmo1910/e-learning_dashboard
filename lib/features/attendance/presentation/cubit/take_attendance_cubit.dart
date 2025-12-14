import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/take_attendance_repo.dart';

part 'take_attendance_state.dart';

class TakeAttendanceCubit extends Cubit<TakeAttendanceState> {
  final TakeAttendanceRepo repo = TakeAttendanceRepo();

  TakeAttendanceCubit() : super(TakeAttendanceInitial());

  Future<void> submitSingleAttendance({
    required String studentId,
    required String scheduleId,
    required bool isPresent,
    required String notes,
  }) async {
    final body = [
      {
        "studentid": studentId,
        "scheduleid": scheduleId,
        "date": DateTime.now().toIso8601String(),
        "ispresent": isPresent,
        "notes": notes,
      },
    ];

    try {
      emit(TakeAttendanceLoading());
      await repo.submitAttendance(body);
    
      emit(TakeAttendanceSuccess());
    } catch (e) {
      emit(TakeAttendanceFailure(e.toString()));
    }
  }
}
