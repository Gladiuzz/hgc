part of 'tournament_cubit.dart';

abstract class TournamentState extends Equatable {
  const TournamentState();

  @override
  List<Object> get props => [];
}

class TournamentInitial extends TournamentState {}

class TournamentLoaded extends TournamentState {
  final List<Tournaments> tournaments;

  TournamentLoaded(this.tournaments);

  @override
  // TODO: implement props
  List<Object> get props => [tournaments];
}

class TournamentLoadingFailed extends TournamentState {
  final String message;

  TournamentLoadingFailed(this.message);

  @override
  // TODO: implement props
  List<Object> get props => [message];
}
