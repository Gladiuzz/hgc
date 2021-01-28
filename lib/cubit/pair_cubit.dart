import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hgc/model/Pair.dart';

part 'pair_state.dart';

class PairCubit extends Cubit<PairState> {
  Pairs pairs;

  PairCubit() : super(PairInitial());

  getPair(pair) async {
    pairs = pair;
    emit(PairLoaded(pairs));
  }

  removePair() async {
    pairs = null;
  }
}
