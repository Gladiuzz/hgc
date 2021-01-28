part of 'user_bloc.dart';

abstract class UserState extends Equatable {}

class UserInitial extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoadingState extends UserState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class UserLoadedState extends UserState {
  List<User> user;

  UserLoadedState({@required this.user});

  @override
  // TODO: implement props
  List<Object> get props => [user];
}

class UserErrorState extends UserState {
  String message;

  UserErrorState({@required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message];
}
