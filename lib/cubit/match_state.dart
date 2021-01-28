part of 'match_cubit.dart';

abstract class MatchState extends Equatable {
  const MatchState();

  @override
  List<Object> get props => [];
}

class MatchInitial extends MatchState {}

class MatchLoaded extends MatchState {
  final Matches matches;

  MatchLoaded(this.matches);

  @override
  // TODO: implement props
  List<Object> get props => [matches];
}

class MatchLoadingFailed extends MatchState {
  final String message;

  MatchLoadingFailed(this.message);

  @override
  // TODO: implement props
  List<Object> get props => [message];
}
