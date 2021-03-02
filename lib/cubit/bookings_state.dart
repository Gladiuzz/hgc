part of 'bookings_cubit.dart';

abstract class BookingsState extends Equatable {
  const BookingsState();

  @override
  List<Object> get props => [];
}

class BookingsInitial extends BookingsState {}

class BookingsLoaded extends BookingsState {
  final Bookings bookings;

  BookingsLoaded(this.bookings);

  @override
  // TODO: implement props
  List<Object> get props => [bookings];
}

class BookingsLoadingFailed extends BookingsState {
  final String message;

  BookingsLoadingFailed(this.message);

  @override
  // TODO: implement props
  List<Object> get props => [message];
}
