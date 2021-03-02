import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hgc/cubit/score_cubit.dart';
import 'package:hgc/model/ScoreCourse.dart';

part 'scorecourse_state.dart';

class ScorecourseCubit extends Cubit<ScorecourseState> {
  ScoreCourse scoreCourse;
  var _listScoreCourse = <Holes>[];
  List<Holes> get listscorecourse => _listScoreCourse;

  ScorecourseCubit() : super(ScorecourseInitial());

  Future<void> getScoreCourse(ScoreCourse score_course) async {
    scoreCourse = score_course;
    emit(ScoreCourseLoaded(score_course));
  }

  void addScoreCourse(Holes scoreCourse) async {
    if (!listscorecourse.contains(scoreCourse)) {
      listscorecourse.add(scoreCourse);
    }
    // emit(ScoreCourseLoaded(scoreCourse));
  }
}
