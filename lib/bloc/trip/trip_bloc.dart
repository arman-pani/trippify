import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:trippify/data/repository/trip_repository.dart';
import 'package:trippify/models/user_generated_trip_model.dart';
import 'package:trippify/models/user_request_trip.dart';

part 'trip_event.dart';
part 'trip_state.dart';

class TripBloc extends Bloc<TripEvent, TripState> {
  final TripRepository tripRepository;
  TripBloc(this.tripRepository) : super(TripInitial()) {
    on<TripRequested>(_onTripRequested);
  }
  void _onTripRequested(
    TripRequested event,
    Emitter<TripState> emit,
  ) async {
    emit(TripLoading());

    try {
      final tripResponse =
          await tripRepository.getAIGeneratedTrip(event.userRequestTrip);
      emit(TripLoaded(tripResponse));
    } catch (e) {
      emit(TripError(e.toString()));
    }
  }
}
