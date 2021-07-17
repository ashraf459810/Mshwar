part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginE extends LoginEvent {
  final String identity;
  final String password;
  LoginE(this.identity, this.password);
}
