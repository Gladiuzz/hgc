import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hgc/cubit/score_cubit.dart';
import 'package:hgc/model/ScoreCourse.dart';

part 'scorecourse_state.dart';

class ScorecourseCubit extends Cubit<ScorecourseState> {
  ScoreCourse scoreCourse;

  ScorecourseCubit() : super(ScorecourseInitial());

  Future<void> getScoreCourse(ScoreCourse score_course) async {
    scoreCourse = score_course;
    emit(ScoreCourseLoaded(score_course));
  }
}
