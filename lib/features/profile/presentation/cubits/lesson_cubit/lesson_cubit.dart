import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teachers_dashboard/features/profile/data/subjects_repo.dart';
part 'lesson_state.dart';

class LessonCubit extends Cubit<LessonState> {
  final SubjectsRepo _subjectsRepo = SubjectsRepo();
  LessonCubit() : super(LessonInitial());

  Future<void> getTeacherSubjectLessons({
    required String teacherSubjectId,
  }) async {
    emit(LessonLoading());
    final response = await _subjectsRepo.getTeacherSubjectLessons(
      teacherSubjectId: teacherSubjectId,
    );
    if (response is Map && response['statusCode'] == 200) {
      emit(LessonSuccess(response['value']));
    } else {
      emit(LessonFailure(response.toString()));
    }
  }
}
