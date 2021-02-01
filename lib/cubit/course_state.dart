part of 'course_cubit.dart';

abstract class CourseState extends Equatable {
  const CourseState();

  @override
  List<Object> get props => [];
}

class CourseInitial extends CourseState {}

class CourseLoaded extends CourseState {
  final Coursesz course;

  CourseLoaded(this.course);

  @override
  // TODO: implement props
  List<Object> get props => [course];
}

class CourseLoadingFailed extends CourseState {
  final String message;

  CourseLoadingFailed(this.message);

  @override
  // TODO: implement props
  List<Object> get props => [message];
}
