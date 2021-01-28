import 'dart:async';
import 'dart:core';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hgc/model/api_return_value.dart';
import 'package:hgc/model/user.dart';
import 'package:hgc/service/UserAPI.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());
  User user;

  signIn(String email, String password) async {
    final result = await UserApi().login(email, password);
    print(result);

    if (result != null) {
      emit(UserLoaded(result));
    } else {
      emit(UserLoadingFailed(result.message));
    }
  }

  signUp(data) async {
    ApiReturnValue<User> result = await UserApi().register(data);

    if (result.value != null) {
      emit(UserLoaded(result.value));
    } else {
      emit(UserLoadingFailed(result.message));
    }
  }

  getUser(data) async {
    user = data;
    print(user);
    emit(UserLoaded(data));
  }
}
