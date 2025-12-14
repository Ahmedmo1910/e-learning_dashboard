import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/student_repo.dart';
part 'student_state.dart';

class StudentCubit extends Cubit<StudentState> {
  final StudentRepo _studentRepo = StudentRepo();
  StudentCubit() : super(StudentInitial());

  Future<void> getStudents() async {
    emit(StudentLoading());
    try {
      final List<dynamic> students = await _studentRepo.getAllStudents();
      emit(StudentSuccess(students));
    } catch (e) {
      emit(StudentFailure(e.toString()));
    }
  }
}
