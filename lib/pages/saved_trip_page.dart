import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:trippify/constants/dummy_data.dart';
import 'package:trippify/utils/custom_appbar.dart';
import 'package:trippify/widgets/saved_trip_card.dart';

class SavedTripPage extends StatefulWidget {
  const SavedTripPage({super.key});

  @override
  State<SavedTripPage> createState() => _SavedTripPageState();
}

class _SavedTripPageState extends State<SavedTripPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: indexAppBar(title: 'Saved Trips', icon: Symbols.star_rounded),
      body: SingleChildScrollView(
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: dummySavedTrips.length,
          itemBuilder: (context, index) {
            return SavedTripCard(
              savedTripModel: dummySavedTrips[index],
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 10),
        ),
      ),
    );
  }
}
