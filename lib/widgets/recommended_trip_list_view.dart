import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:trippify/constants/dummy_data.dart';
import 'package:trippify/constants/textstyle_constants.dart';
import 'package:trippify/constants/theme_constants.dart';
import 'package:trippify/helpers/common_methods.dart';
import 'package:trippify/models/recommended_trip_model.dart';
import 'package:trippify/widgets/custom_gradient_button.dart';

class RecommendedTripListView extends StatelessWidget {
  const RecommendedTripListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 3,
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final recommendedTrip = dummyRecommendedTrips[index];
        return RecommendedTripCard(recommendedTripModel: recommendedTrip);
      },
      separatorBuilder: (context, index) => const SizedBox(height: 20),
    );
  }
}

class RecommendedTripCard extends StatelessWidget {
  final RecommendedTripModel recommendedTripModel;

  const RecommendedTripCard({super.key, required this.recommendedTripModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: shadowList),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Column(
          children: [
            Image.asset(
              "assets/images/home_bg_image.png",
              fit: BoxFit.fill,
              height: 250,
              width: double.infinity,
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recommendedTripModel.title,
                    style: TextstyleConstants.titleTextStyle,
                  ),
                  Row(
                    children: [
                      Icon(Symbols.calendar_month_rounded),
                      SizedBox(width: 5),
                      Text(
                        '${formatDate(recommendedTripModel.startDateTime)} - ${formatDate(recommendedTripModel.endDateTime)}',
                        style: TextstyleConstants.mediumTextStyle2,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Start from',
                    style: TextstyleConstants.mediumTextStyle2,
                  ),
                  RichText(
                    text: TextSpan(
                        text: "\$${recommendedTripModel.costPerPerson}",
                        style: TextstyleConstants.titleTextStyle,
                        children: [
                          TextSpan(
                            text: '/person',
                            style: TextstyleConstants.mediumTextStyle2,
                          )
                        ]),
                  ),
                  SizedBox(height: 15),
                  CustomGradientButton(
                    label: "Start Trippin'",
                    onPressed: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
