import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hgc/model/api_return_value.dart';
import 'package:hgc/model/tournament_model.dart';
import 'package:hgc/service/TournamentAPI.dart';
import 'package:hgc/ui/pages/Tournament/Tournament.dart';

part 'tournament_state.dart';

class TournamentCubit extends Cubit<TournamentState> {
  TournamentCubit() : super(TournamentInitial());

  Future<void> getTournament() async {
    ApiReturnValue<List<Tournaments>> result =
        await TournamentApi().showTournament();

    if (result.value != null) {
      emit(TournamentLoaded(result.value));
    } else {
      emit(TournamentLoadingFailed(result.message));
    }
  }
}
