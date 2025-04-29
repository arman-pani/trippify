import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:trippify/bloc/trip_bloc.dart';
import 'package:trippify/data/data_provider/trip_dataprovider.dart';
import 'package:trippify/data/repository/trip_repository.dart';
import 'package:trippify/pages/index.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // safer for async in main
  await dotenv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
              BlocProvider<TripBloc>(
                create: (_) => TripBloc(context.read<TripRepository>()),
              ),
            ],
            child: MaterialApp(
              title: 'Trippify',
              theme: ThemeData(
                useMaterial3: true,
              ),
              home: const IndexPage(),
            ),
          );
        },
      ),
    );
  }
}
