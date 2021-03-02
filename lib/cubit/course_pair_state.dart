part of 'course_pair_cubit.dart';

abstract class CoursePairState extends Equatable {
  const CoursePairState();

  @override
  List<Object> get props => [];
}

class CoursePairInitial extends CoursePairState {}

class CoursePairLoaded extends CoursePairState {
  final List<CoursePair> coursePair;

  CoursePairLoaded(this.coursePair);

  @override
  // TODO: implement props
  List<Object> get props => [coursePair];
}

class CoursePairLoadingFailed extends CoursePairState {
  final String message;

  CoursePairLoadingFailed(this.message);

  @override
  // TODO: implement props
  List<Object> get props => [message];
}
