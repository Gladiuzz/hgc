part of 'scorecourse_cubit.dart';

abstract class ScorecourseState extends Equatable {
  const ScorecourseState();

  @override
  List<Object> get props => [];
}

class ScorecourseInitial extends ScorecourseState {}

class ScoreCourseLoaded extends ScorecourseState {
  final ScoreCourse scoreCourse;

  ScoreCourseLoaded(this.scoreCourse);

  @override
  // TODO: implement props
  List<Object> get props => [scoreCourse];
}

class ScoreCourseLoadingFailed extends ScorecourseState {
  final String message;

  ScoreCourseLoadingFailed(this.message);

  @override
  // TODO: implement props
  List<Object> get props => [message];
}
