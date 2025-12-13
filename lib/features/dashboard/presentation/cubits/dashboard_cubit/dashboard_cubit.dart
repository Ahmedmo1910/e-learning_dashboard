import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teachers_dashboard/features/dashboard/data/dashboard_repo.dart';
import 'package:teachers_dashboard/core/helper_functions/secure_storage.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardState());

  Future<void> getAllData({bool refresh = false}) async {
    try {
      final cachedProfile = await SecureStorage.getProfile();

      if (cachedProfile != null && !refresh) {
        emit(state.copyWith(loading: false, profile: cachedProfile));
      } else {
        emit(state.copyWith(loading: true));
      }

      final profile = await DashboardRepo().getTeacherProfile();
      final studentsCount =
          await DashboardRepo().getAllStudents() as List<dynamic>;
      final classesCount =
          await DashboardRepo().getAllClasses() as List<dynamic>;

      await SecureStorage.saveProfile(profile);

      emit(
        state.copyWith(
          loading: false,
          profile: profile,
          studentsCount: studentsCount.length,
          classesCount: classesCount.length,
        ),
      );
    } catch (e) {
      emit(state.copyWith(loading: false, error: e.toString()));
    }
  }
}
