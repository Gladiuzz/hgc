part of 'verificators_cubit.dart';

abstract class VerificatorsState extends Equatable {
  const VerificatorsState();

  @override
  List<Object> get props => [];
}

class VerificatorsInitial extends VerificatorsState {}

class VerificatorsLoaded extends VerificatorsState {
  final Verificators_tournament verificator;

  VerificatorsLoaded(this.verificator);

  @override
  // TODO: implement props
  List<Object> get props => [verificator];
}

class VerificatorsLoadingFailed extends VerificatorsState {
  final String message;

  VerificatorsLoadingFailed(this.message);

  @override
  // TODO: implement props
  List<Object> get props => [message];
}
