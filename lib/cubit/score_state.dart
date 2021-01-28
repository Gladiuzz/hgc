part of 'score_cubit.dart';

abstract class ScoreState extends Equatable {
  const ScoreState();

  @override
  List<Object> get props => [];
}

class ScoreInitial extends ScoreState {}

class ScoreLoaded extends ScoreState {
  final CourseScore score;

  ScoreLoaded(this.score);

  @override
  // TODO: implement props
  List<Object> get props => [score];
}

class ScoreLoadingFailed extends ScoreState {
  final String message;

  ScoreLoadingFailed(this.message);

  @override
  // TODO: implement props
  List<Object> get props => [message];
}
