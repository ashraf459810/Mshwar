part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginS extends LoginState {}

class Loading extends LoginState {}

class Error extends LoginState {
  final String error;
  Error(this.error);
}
