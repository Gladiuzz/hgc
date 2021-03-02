import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hgc/model/TournamentLeaderboard.dart';

part 'leaderboard_state.dart';

class LeaderboardCubit extends Cubit<LeaderboardState> {
  Tournament_Leaderboard leaderboard;

  LeaderboardCubit() : super(LeaderboardInitial());

  Future<void> getLeaderboard(
      Tournament_Leaderboard tournament_leaderboard) async {
    leaderboard = tournament_leaderboard;

    emit(LeaderboardLoaded(tournament_leaderboard));
  }
}
