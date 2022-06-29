part of 'user_bloc.dart';

abstract class UserState {}

class UserInitial extends UserState {}

class GetUserSuccess extends UserState {
  User? user;

  GetUserSuccess({this.user});
}

class UserLoading extends UserState {}

class UserError extends UserState {
  String? error;

  UserError({this.error});
}
