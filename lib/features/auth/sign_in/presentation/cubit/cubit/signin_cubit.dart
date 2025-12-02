import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teachers_dashboard/features/auth/data/auth_repo.dart';
part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  final AuthRepo _authRepo;
  SigninCubit(this._authRepo) : super(SigninInitial());

  Future<void> login({required String email, required String password}) async {
    emit(SigninLoading());
    final response = await _authRepo.login(password: password, email: email);
    if (response["success"] == true && response["auth"] != null) {
      emit(SigninSuccess());
    } else {
      emit(
        SigninFailure(response["message"] ?? "Login failed please try again"),
      );
    }
  }
  
}
