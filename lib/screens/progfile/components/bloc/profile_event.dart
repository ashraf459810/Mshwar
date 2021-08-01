part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

class GetProfileEvent extends ProfileEvent {}

class CartHistoryEvent extends ProfileEvent {}

class EditProfileEvent extends ProfileEvent {
  final String name;
  final String email;
  final int mobile;
  EditProfileEvent(this.mobile, this.email, this.name);
}
