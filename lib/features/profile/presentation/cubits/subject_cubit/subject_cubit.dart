import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teachers_dashboard/features/profile/data/subjects_repo.dart';
part 'subject_state.dart';

class SubjectCubit extends Cubit<SubjectState> {
  final SubjectsRepo _subjectsRepo = SubjectsRepo();
  SubjectCubit() : super(SubjectInitial());

  Future<void> getTeacherSubjects() async {
    emit(SubjectLoading());
    final response = await _subjectsRepo.getTeacherSubjects();
    if (response is Map && response['statusCode'] == 200) {
      emit(SubjectSuccess(response['value']));
    } else {
      emit(SubjectFailure(response.toString()));
    }
  }
}
