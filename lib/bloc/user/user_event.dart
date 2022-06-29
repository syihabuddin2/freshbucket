part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class LoadUserEvent extends UserEvent {}

class DetailUserEvent extends UserEvent {
  String? imgPath;
  String? name;
  String? email;

  DetailUserEvent({this.imgPath, this.name, this.email});
}
