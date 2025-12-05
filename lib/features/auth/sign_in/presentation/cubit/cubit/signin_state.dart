part of 'signin_cubit.dart';

sealed class SigninState {}

final class SigninInitial extends SigninState {}

class SigninLoading extends SigninState {}

class SigninSuccess extends SigninState {}

class SigninFailure extends SigninState {
  final String errorMsg;
  SigninFailure(this.errorMsg);
}
