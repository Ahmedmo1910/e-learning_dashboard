part of 'subject_cubit.dart';

sealed class SubjectState {}

final class SubjectInitial extends SubjectState {}

final class SubjectLoading extends SubjectState {}

final class SubjectSuccess extends SubjectState {
  final dynamic subjects;
  SubjectSuccess(this.subjects);
}

final class SubjectFailure extends SubjectState {
  final String errorMessage;
  SubjectFailure(this.errorMessage);
}
