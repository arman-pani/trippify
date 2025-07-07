import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trippify/helpers/hive_method.dart';
import 'package:trippify/models/user_generated_trip_model.dart';

part 'saved_trip_event.dart';
part 'saved_trip_state.dart';

class SavedTripBloc extends Bloc<SavedTripEvent, SavedTripState> {
  SavedTripBloc() : super(SavedTripInitial()) {
    on<SavedTripsRequested>(_onSavedTripsRequested);
  }

  void _onSavedTripsRequested(
    SavedTripsRequested event,
    Emitter<SavedTripState> emit,
  ) async {
    emit(SavedTripLoading());

    try {
      // Simulate a delay for loading state
      await Future.delayed(const Duration(seconds: 2));

      // Fetch saved trips from local DB
      final savedTrips = await HiveTripMethods.getAllTripsFromLocalDB();

      emit(SavedTripLoaded(savedTrips));
    } catch (e) {
      emit(SavedTripError(e.toString()));
    }
  }
}
