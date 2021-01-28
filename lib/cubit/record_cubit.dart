import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hgc/model/Record.dart';

part 'record_state.dart';

class RecordCubit extends Cubit<RecordState> {
  Record records;

  RecordCubit() : super(RecordInitial());

  getRecord(record) async {
    records = record;
    emit(RecordLoaded(records));
  }

  removeRecord() async {
    records = null;
  }
}
