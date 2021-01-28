part of 'member_cubit.dart';

abstract class MemberState extends Equatable {
  const MemberState();

  @override
  List<Object> get props => [];
}

class MemberInitial extends MemberState {}

class MemberLoaded extends MemberState {
  final Member member;

  MemberLoaded(this.member);

  @override
  // TODO: implement props
  List<Object> get props => [member];
}

class MemberLoadingFailed extends MemberState {
  final String message;

  MemberLoadingFailed(this.message);

  @override
  // TODO: implement props
  List<Object> get props => [message];
}
