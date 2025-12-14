part of 'take_attendance_cubit.dart';

sealed class TakeAttendanceState {}

class TakeAttendanceInitial extends TakeAttendanceState {}

class TakeAttendanceLoading extends TakeAttendanceState {}

class TakeAttendanceSuccess extends TakeAttendanceState {}

class TakeAttendanceFailure extends TakeAttendanceState {
  final String error;
  TakeAttendanceFailure(this.error);
}
