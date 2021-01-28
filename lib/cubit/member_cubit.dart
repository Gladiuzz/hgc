import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hgc/model/member.dart';

part 'member_state.dart';

class MemberCubit extends Cubit<MemberState> {
  Member member;

  MemberCubit() : super(MemberInitial());

  Future<void> getVerificator(Member members) async {
    member = members;
    print(members);
    emit(MemberLoaded(members));
  }

  removeVerificator() async {
    member = null;
  }
}
