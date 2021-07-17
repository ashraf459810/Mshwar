part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

class RegisterE extends RegisterEvent {
  final String name;
  final String password;
  final String email;
  final int cityid;
  final int phone;

  RegisterE(this.name, this.password,this.cityid,this.email,this.phone);
}

class CitiesEvent extends RegisterEvent {}
