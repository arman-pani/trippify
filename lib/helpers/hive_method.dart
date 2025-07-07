import 'package:hive/hive.dart';
import 'package:trippify/models/user_generated_trip_model.dart';

class HiveTripMethods {
  static const String boxName = 'savedTrips';

  static Future<void> saveTripToLocalDB(UserGeneratedTripModel trip) async {
    final box = await Hive.openBox<UserGeneratedTripModel>(boxName);
    await box.put(trip.id, trip);
  }

  static Future<UserGeneratedTripModel?> readTripFromLocalDB(String id) async {
    final box = await Hive.openBox<UserGeneratedTripModel>(boxName);
    return box.get(id);
  }

  static Future<void> updateTripFromLocalDB(UserGeneratedTripModel trip) async {
    final box = await Hive.openBox<UserGeneratedTripModel>(boxName);
    await box.put(trip.id, trip);
  }

  static Future<void> deleteTripFromLocalDB(String id) async {
    final box = await Hive.openBox<UserGeneratedTripModel>(boxName);
    await box.delete(id);
  }

  static Future<List<UserGeneratedTripModel>> getAllTripsFromLocalDB() async {
    final box = await Hive.openBox<UserGeneratedTripModel>(boxName);
    return box.values.toList();
  }
}
