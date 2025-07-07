part of 'saved_trip_bloc.dart';

@immutable
sealed class SavedTripState {}

final class SavedTripInitial extends SavedTripState {}

final class SavedTripLoading extends SavedTripState {}

final class SavedTripLoaded extends SavedTripState {
  final List<UserGeneratedTripModel> savedTrips;

  SavedTripLoaded(this.savedTrips);
}

final class SavedTripError extends SavedTripState {
  final String error;

  SavedTripError(this.error);
}
