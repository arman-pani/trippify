part of 'trip_bloc.dart';

@immutable
sealed class TripEvent {}

final class TripRequested extends TripEvent {
  final UserRequestTrip userRequestTrip;

  TripRequested(this.userRequestTrip);
}
