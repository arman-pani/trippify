import 'package:trippify/data/data_provider/trip_dataprovider.dart';
import 'package:trippify/models/user_generated_trip_model.dart';
import 'package:trippify/models/user_request_trip.dart';

class TripRepository {
  final TripDataProvider tripDataProvider;
  TripRepository(this.tripDataProvider);

  Future<UserGeneratedTripModel> getAIGeneratedTrip(
      UserRequestTrip tripRequest) async {
    try {
      final response = await tripDataProvider.getAIGeneratedTrip(tripRequest);

      return UserGeneratedTripModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
