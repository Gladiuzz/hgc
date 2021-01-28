import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:hgc/model/user.dart';
import 'package:hgc/service/UserAPI.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserApi userApi;

  UserBloc({@required this.userApi}) : super(null);

  @override
  // TODO: implement initialState
  UserState get initialState => UserInitial();

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is FetchUserEvent) {
      yield UserLoadingState();
      try {
        List<User> user = await userApi.showUser();
        yield UserLoadedState(user: user);
      } catch (e) {
        yield UserErrorState(message: e.toString());
      }
    }
  }
}
