import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teachers_dashboard/features/lessons/presentation/cubit/lessons_state.dart';
import 'package:teachers_dashboard/features/lessons/presentation/data/lessons_repo.dart';
import 'package:teachers_dashboard/generated/l10n.dart';

class LessonsCubit extends Cubit<LessonsState> {
  final LessonsRepo lessonsRepo = LessonsRepo();
  LessonsCubit() : super(LessonsInitial());

  Future<void> createLesson({
    required String lessontitle,
    required String lessondescription,
    required int sort,
    required String teachersubjectid,
  }) async {
    emit(LessonsLoading());
    final response = await lessonsRepo.createLesson(
      lessontitle: lessontitle,
      lessondescription: lessondescription,
      sort: sort,
      teachersubjectid: teachersubjectid,
    );
    if (response['statusCode'] == 200) {
      emit(LessonCreated());
    } else {
      emit(LessonsFailure(response['message'] ??  S.current.failedToCreateLesson));
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
    final response = await lessonsRepo.updateLesson(
      id: id,
      lessonTitle: lessonTitle,
      lessonDescription: lessonDescription,
      sort: sort,
      teacherSubjectId: teacherSubjectId,
    );
    if (response['statusCode'] == 200) {
      emit(LessonUpdated());
    } else {
      emit(LessonsFailure(response['message'] ?? S.current.failedToUpdateLesson));
    }
  }

  Future<void> deleteLesson({required String lessonId}) async {
    emit(LessonsLoading());
    final response = await lessonsRepo.deleteLesson(lessonId: lessonId);
    if (response['success'] == true) {
      emit(LessonDeleted());
    } else {
      emit(LessonsFailure(response['message'] ?? S.current.failedToDeleteLesson));
    }
  }
}
