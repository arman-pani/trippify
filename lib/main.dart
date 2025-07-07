import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:trippify/bloc/auth/auth_bloc.dart';
import 'package:trippify/bloc/saved_trip/saved_trip_bloc.dart';
import 'package:trippify/bloc/trip/trip_bloc.dart';
import 'package:trippify/data/data_provider/trip_dataprovider.dart';
import 'package:trippify/data/repository/trip_repository.dart';
import 'package:trippify/firebase_options.dart';
import 'package:trippify/helpers/timeofday_adapter.dart';
import 'package:trippify/models/daywise_plan_model.dart';
import 'package:trippify/models/flight_ticket_model.dart';
import 'package:trippify/models/poi_model.dart';
import 'package:trippify/models/train_ticket_model.dart';
import 'package:trippify/models/user_generated_trip_model.dart';
import 'package:trippify/utils/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Hive.initFlutter();

  final appRouter = await getAppRouter();

  Hive.openBox<UserGeneratedTripModel>("savedTrips");
  Hive.registerAdapter(UserGeneratedTripModelAdapter());
  Hive.registerAdapter(FlightTicketModelAdapter());
  Hive.registerAdapter(TrainTicketModelAdapter());
  Hive.registerAdapter(DaywisePlanModelAdapter());
  Hive.registerAdapter(POIModelAdapter());
  Hive.registerAdapter(TimeOfDayAdapter());

  await dotenv.load(fileName: ".env");
  runApp(MyApp(appRouter));
}

class MyApp extends StatelessWidget {
  final GoRouter appRouter;

  const MyApp(this.appRouter, {super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<TripRepository>(
          create: (_) => TripRepository(TripDataProvider()),
        ),
      ],
      child: Builder(
        builder: (context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<AuthBloc>(create: (_) => AuthBloc()),
              BlocProvider<TripBloc>(
                create: (_) => TripBloc(context.read<TripRepository>()),
              ),
              BlocProvider<SavedTripBloc>(create: (_) => SavedTripBloc()),
            ],
            child: MaterialApp.router(
              routerConfig: appRouter,
            ),
          );
        },
      ),
    );
  }
}
