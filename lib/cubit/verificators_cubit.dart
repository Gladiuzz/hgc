import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hgc/model/verificators.dart';

part 'verificators_state.dart';

class VerificatorsCubit extends Cubit<VerificatorsState> {
  VerificatorsCubit() : super(VerificatorsInitial());
  Verificators_tournament verificators;

  getTournamentVerificator(
      Verificators_tournament verificators_tournament) async {
    verificators = verificators_tournament;
    emit(VerificatorsLoaded(verificators));
  }

  removeVerificator() async {
    verificators = null;
  }
}
