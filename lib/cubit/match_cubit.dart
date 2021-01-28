import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hgc/model/api_return_value.dart';
import 'package:hgc/model/match.dart';
import 'package:hgc/service/MatchAPI.dart';

part 'match_state.dart';

class MatchCubit extends Cubit<MatchState> {
  MatchCubit() : super(MatchInitial());
  Matches matches;

  createMatch(data) async {
    var result = await MatchApi().createMatch(data);

    if (result != null) {
      emit(MatchLoaded((state as MatchLoaded).matches));
    }
  }

  getMatch(match) async {
    // if (matches != null) {
    //   matches.clear();
    // }
    matches = match;
    print("berhasil mengambil data");
    emit(MatchLoaded(matches));
  }

  getMatchDetail(match) async {
    matches = match;
    emit(MatchLoaded(matches));
  }

  removeMatch() async {
    matches = null;
  }
}
