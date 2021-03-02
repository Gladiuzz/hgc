import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hgc/model/CoursePair.dart';

part 'course_pair_state.dart';

class CoursePairCubit extends Cubit<CoursePairState> {
  List<CoursePair> coursePair;

  CoursePairCubit() : super(CoursePairInitial());

  Future<void> getCoursePair(course_pair) async {
    coursePair = course_pair;
    emit(CoursePairLoaded(coursePair));
  }
}
