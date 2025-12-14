part of 'exam_cubit.dart';

sealed class ExamState {}

final class ExamInitial extends ExamState {}

final class ExamLoading extends ExamState {}

final class ExamLoaded extends ExamState {
  final List<dynamic> attachments;
  ExamLoaded(this.attachments);
}

final class ExamCreated extends ExamState {}

final class ExamUpdated extends ExamState {}

final class ExamDeleted extends ExamState {}

final class ExamFailure extends ExamState {
  final String errorMsg;
  ExamFailure(this.errorMsg);
}
