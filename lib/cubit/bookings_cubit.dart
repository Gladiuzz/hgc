import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hgc/model/bookDetail.dart';
import 'package:hgc/model/bookings.dart';

part 'bookings_state.dart';

class BookingsCubit extends Cubit<BookingsState> {
  List<Book> book;
  DetailBooking detailbooking;

  BookingsCubit() : super(BookingsInitial());

  getActiveTournament(data) async {
    book = data;
    emit(BookingsLoaded(book));
  }

  getDetailBooking(data) async {
    detailbooking = data;
  }

  removeDetailBooking() async {
    detailbooking = null;
  }
}
