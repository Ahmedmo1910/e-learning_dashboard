import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teachers_dashboard/features/lessons/presentation/cubit/lessons_state.dart';
import 'package:teachers_dashboard/features/lessons/presentation/data/lessons_repo.dart';

class LessonsCubit extends Cubit<LessonsState> {
  final LessonsRepo lessonsRepo;
  LessonsCubit(this.lessonsRepo) : super(LessonsInitial());

  Future<void> createLesson({
    required String lessontitle,
    required String lessondescription,
    required int sort,
    required String teachersubjectid,
  }) async {
    emit(LessonCreated());
    final responce = await lessonsRepo.createLesson(
      lessontitle: lessontitle,
      lessondescription: lessondescription,
      sort: sort,
      teachersubjectid: teachersubjectid,
    );
    if (responce['success'] == true) {
      emit(LessonCreated());
    } else {
      emit(LessonsFailure(responce['message'] ?? "Failed to create lesson"));
    }
  }

  Future<void> updateLesson({
    required String id,
    required String lessonTitle,
    required String lessonDescription,
    required int sort,
    required String teacherSubjectId,
  }) async {
    emit(LessonsLoading());
    final responce = await lessonsRepo.updateLesson(
      id: id,
      lessonTitle: lessonTitle,
      lessonDescription: lessonDescription,
      sort: sort,
      teacherSubjectId: teacherSubjectId,
    );
    if (responce['success'] == true) {
      emit(LessonUpdated());
    } else {
      emit(LessonsFailure(responce['message'] ?? "Failed to update lesson"));
    }
  }

  Future<void> deleteLesson({required String lessonId}) async {
    emit(LessonsLoading());
    final responce = await lessonsRepo.deleteLesson(lessonId: lessonId);
    if (responce['success'] == true) {
      emit(LessonDeleted());
    } else {
      emit(LessonsFailure(responce['message'] ?? "Failed to delete lesson"));
    }
  }
}
