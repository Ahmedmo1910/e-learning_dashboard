class ExamState {
  final bool isLoading;
  final bool isSuccess;
  final String errorMessage;

  ExamState({
    this.isLoading = false,
    this.isSuccess = false,
    this.errorMessage = '',
  });

  ExamState copyWith({
    bool? isLoading,
    bool? isSuccess,
    String? errorMessage,
  }) {
    return ExamState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExamState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          isSuccess == other.isSuccess &&
          errorMessage == other.errorMessage;

  @override
  int get hashCode =>
      isLoading.hashCode ^ isSuccess.hashCode ^ errorMessage.hashCode;
}