part of 'record_cubit.dart';

abstract class RecordState extends Equatable {
  const RecordState();

  @override
  List<Object> get props => [];
}

class RecordInitial extends RecordState {}

class RecordLoaded extends RecordState {
  final Record records;

  RecordLoaded(this.records);

  @override
  // TODO: implement props
  List<Object> get props => [records];
}

class RecordLoadingFailed extends RecordState {
  final String message;

  RecordLoadingFailed(this.message);

  @override
  // TODO: implement props
  List<Object> get props => [message];
}
