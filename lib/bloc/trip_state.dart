part of 'trip_bloc.dart';

@immutable
sealed class TripState {}

final class TripInitial extends TripState {}

final class TripLoading extends TripState {}

final class TripLoaded extends TripState {
  final UserGeneratedTripModel aiGeneratedTrip;

  TripLoaded(this.aiGeneratedTrip);
}

final class TripError extends TripState {
  final String message;

  TripError(this.message);
}
