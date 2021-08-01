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

class CartHistoryState extends ProfileState {
  final CartHistory cartHistory;
  CartHistoryState(this.cartHistory);
}

class EditProfileState extends ProfileState {
  final EditProfile editProfile;
  EditProfileState(this.editProfile);
}

class SupportState extends ProfileState {}
