part of 'saved_trip_bloc.dart';

@immutable
sealed class SavedTripEvent {}

final class SavedTripsRequested extends SavedTripEvent {}
