import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hgc/model/golfCourse.dart';

part 'course_state.dart';

class CourseCubit extends Cubit<CourseState> {
  Courses course;

  CourseCubit() : super(CourseInitial());

  Future<void> getCourse(Courses courses) async {
    course = courses;

    print("testing ${course}");
    emit(CourseLoaded(courses));
  }

  removeCourse() async {
    course = null;
  }
}
