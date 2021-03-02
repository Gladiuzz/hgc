part of 'leaderboard_cubit.dart';

abstract class LeaderboardState extends Equatable {
  const LeaderboardState();

  @override
  List<Object> get props => [];
}

class LeaderboardInitial extends LeaderboardState {}

class LeaderboardLoaded extends LeaderboardState {
  final Tournament_Leaderboard leaderboard;

  LeaderboardLoaded(this.leaderboard);

  @override
  // TODO: implement props
  List<Object> get props => [leaderboard];
}

class LeaderboardLoadingFailed extends LeaderboardState {
  final String message;

  LeaderboardLoadingFailed(this.message);

  @override
  // TODO: implement props
  List<Object> get props => [message];
}
