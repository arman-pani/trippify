import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:trippify/bloc/saved_trip/saved_trip_bloc.dart';
import 'package:trippify/constants/colors_constants.dart';
import 'package:trippify/constants/textstyle_constants.dart';
import 'package:trippify/utils/custom_appbar.dart';
import 'package:trippify/utils/snack_bar.dart';
import 'package:trippify/widgets/saved_trip_card.dart';

class SavedTripPage extends StatefulWidget {
  const SavedTripPage({super.key});

  @override
  State<SavedTripPage> createState() => _SavedTripPageState();
}

class _SavedTripPageState extends State<SavedTripPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SavedTripBloc>(context).add(SavedTripsRequested());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: indexAppBar(title: 'Saved Trips', icon: Symbols.star_rounded),
      body: BlocConsumer<SavedTripBloc, SavedTripState>(
        listener: (context, state) {
          if (state is SavedTripError) {
            SnackBarUtils.showSnackBar(context, state.error);
          }
        },
        builder: (context, state) {
          if (state is SavedTripLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SavedTripLoaded) {
            final savedTrips = state.savedTrips;
            return SingleChildScrollView(
              child: ListView.separated(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: savedTrips.length,
                itemBuilder: (context, index) {
                  return SavedTripCard(
                    savedTripModel: savedTrips[index],
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
              ),
            );
          } else {
            // Handle the initial state or any other unexpected state
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Symbols.trip,
                    size: 100,
                    color: ColorsConstants.blueColor,
                  ),
                  Text(
                    'No trips found!',
                    style: TextstyleConstants.titleTextStyle
                        .copyWith(color: ColorsConstants.blueColor),
                  ),
                  SizedBox(height: 100),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
