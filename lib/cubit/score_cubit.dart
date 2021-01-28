import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hgc/model/CourseScore.dart';

part 'score_state.dart';

class ScoreCubit extends Cubit<ScoreState> {
  CourseScore coursescore;

  ScoreCubit() : super(ScoreInitial());

  getCourseScore(CourseScore courseScores) async {
    coursescore = courseScores;
    print(coursescore);
    emit(ScoreLoaded(coursescore));
  }
}
