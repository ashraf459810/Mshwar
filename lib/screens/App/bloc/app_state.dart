part of 'app_bloc.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

class IsLoginState extends AppState {
  final bool islogin;
  IsLoginState(this.islogin);
}
