part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class GetProfileState extends ProfileState {
  final ProfileModel profileModel;
  GetProfileState(this.profileModel);
}

class Loading extends ProfileState {}

class Error extends ProfileState {
  final String error;
  Error(this.error);
}
