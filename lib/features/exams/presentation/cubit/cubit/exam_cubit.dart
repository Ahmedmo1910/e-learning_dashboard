import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teachers_dashboard/features/exams/data/exam_repository.dart';
import 'exam_state.dart';

class ExamCubit extends Cubit<ExamState> {
  final ExamRepository examRepository;

  ExamCubit({required this.examRepository}) : super(ExamState());

  Future<void> createExam({
    required String teacherSubjectLessonId,
    required String attachment,
    required String attachmentUrl,
    required String attachmentTitle,
    required String attachmentDescription,
  }) async {
    emit(state.copyWith(isLoading: true, errorMessage: '', isSuccess: false));
    
    try {
      await examRepository.addExam(
        teacherSubjectLessonId: teacherSubjectLessonId,
        attachment: attachment,
        attachmentUrl: attachmentUrl,
        attachmentTitle: attachmentTitle,
        attachmentDescription: attachmentDescription,
      );

      emit(state.copyWith(isLoading: false, isSuccess: true));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: e.toString().replaceAll('Exception: ', ''),
      ));
    }
  }

  Future<void> deleteExam({required String attachmentId}) async {
    emit(state.copyWith(isLoading: true, errorMessage: '', isSuccess: false));
    
    try {
      await examRepository.removeExam(attachmentId: attachmentId);
      emit(state.copyWith(isLoading: false, isSuccess: true));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: e.toString().replaceAll('Exception: ', ''),
      ));
    }
  }

  void resetState() {
    emit(ExamState());
  }
}