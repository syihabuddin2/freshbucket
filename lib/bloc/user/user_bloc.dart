import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freshbucket/model/user/user.dart';
import 'package:freshbucket/services/user/userservice.dart';
import 'package:meta/meta.dart';

import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserService userService;

  UserBloc({required this.userService}) : super(UserInitial());

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is LoadUserEvent) {
      try {
        yield UserLoading();
        final responseUserData = await userService.getRandomUser();

        if (responseUserData.results != null) {
          yield GetUserSuccess(user: responseUserData);
        }
      } catch (e) {
        yield UserError(error: e.toString());
        print('e: $e');
      }
    }
  }
}
