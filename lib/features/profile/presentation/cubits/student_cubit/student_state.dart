part of 'student_cubit.dart';

sealed class StudentState {}

final class StudentInitial extends StudentState {}

final class StudentLoading extends StudentState {}

final class StudentSuccess extends StudentState {
  final List<dynamic> students;

  StudentSuccess(this.students);
}

final class StudentFailure extends StudentState {
  final String errorMessage;

  StudentFailure(this.errorMessage);
}
