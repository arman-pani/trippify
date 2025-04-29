import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:trippify/constants/textstyle_constants.dart';
import 'package:trippify/constants/theme_constants.dart';
import 'package:trippify/helpers/common_methods.dart';
import 'package:trippify/models/user_generated_trip_model.dart';
import 'package:trippify/pages/trip_page.dart';

class SavedTripCard extends StatelessWidget {
  final UserGeneratedTripModel savedTripModel;
  const SavedTripCard({super.key, required this.savedTripModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TripPage(tripModel: savedTripModel),
          )),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: shadowList,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.horizontal(left: Radius.circular(15)),
              child: Image.asset(
                "assets/images/home_bg_image.png",
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 3,
              children: [
                Text(
                  savedTripModel.name,
                  style: TextstyleConstants.titleTextStyle2,
                ),
                Row(
                  children: [
                    Icon(Symbols.calendar_month_rounded, size: 18),
                    SizedBox(width: 2),
                    Text(
                      '${convertDateString(savedTripModel.startDate)} - ${convertDateString(savedTripModel.endDate)}',
                      style: TextstyleConstants.smallTextStyle2,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Symbols.money_bag_rounded, size: 18),
                    SizedBox(width: 2),
                    Text(
                      "\$${savedTripModel.costPerPerson} /person",
                      style: TextstyleConstants.smallTextStyle2,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
