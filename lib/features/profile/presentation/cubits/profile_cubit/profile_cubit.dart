import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teachers_dashboard/core/helper_functions/secure_storage.dart';
import 'package:teachers_dashboard/features/profile/data/profile_repo.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo _repo = ProfileRepo();

  ProfileCubit() : super(ProfileInitial());

  Future<void> getProfile({bool refresh = false}) async {
    emit(ProfileLoading());

    try {
      final localProfile = await SecureStorage.getProfile();

      if (localProfile != null && !refresh) {
        emit(ProfileLoaded(localProfile));
      }

      final profileData = await _repo.getTeacherProfile();

      if (profileData is Map<String, dynamic>) {
        await SecureStorage.saveProfile(profileData);
        emit(ProfileLoaded(profileData));
      } else {
        emit(ProfileFailure(profileData.toString()));
      }
    } catch (e) {
      emit(ProfileFailure(e.toString()));
    }
  }
}
