part of 'pair_cubit.dart';

abstract class PairState extends Equatable {
  const PairState();

  @override
  List<Object> get props => [];
}

class PairInitial extends PairState {}

class PairLoaded extends PairState {
  final Pairs pairs;

  PairLoaded(this.pairs);

  @override
  // TODO: implement props
  List<Object> get props => [pairs];
}

class PairLoadingFailed extends PairState {
  final String message;

  PairLoadingFailed(this.message);

  @override
  // TODO: implement props
  List<Object> get props => [message];
}
