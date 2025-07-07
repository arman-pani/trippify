import 'package:flutter/material.dart';
import 'package:trippify/constants/colors_constants.dart';
import 'package:trippify/constants/textstyle_constants.dart';
import 'package:trippify/helpers/common_methods.dart';
import 'package:trippify/helpers/hive_method.dart';
import 'package:trippify/models/daywise_plan_model.dart';
import 'package:trippify/models/user_generated_trip_model.dart';
import 'package:trippify/utils/custom_appbar.dart';
import 'package:trippify/utils/snack_bar.dart';
import 'package:trippify/widgets/custom_gradient_button.dart';
import 'package:trippify/widgets/trip_timeline.dart';

class DetailedTripPage extends StatefulWidget {
  final UserGeneratedTripModel tripModel;
  const DetailedTripPage({super.key, required this.tripModel});

  @override
  State<DetailedTripPage> createState() => _DetailedTripPageState();
}

class _DetailedTripPageState extends State<DetailedTripPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.tripModel.itinerary.length,
      child: Scaffold(
        appBar: commonAppBar(
          title: 'Trip Plan Details',
          context: context,
          bottom: TabBar(
            labelColor: ColorsConstants.blueColor,
            unselectedLabelColor: Colors.grey,
            indicatorColor: ColorsConstants.blueColor,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 2,
            tabs: List.generate(widget.tripModel.itinerary.length, (dayIndex) {
              return Tab(text: '${dayIndex + 1}');
            }),
          ),
        ),
        body: TabBarView(
          children:
              List.generate(widget.tripModel.itinerary.length, (dayIndex) {
            final daywisePlan = widget.tripModel.itinerary[dayIndex];
            return DayWisePlanScreen(
              daywisePlanModel: daywisePlan,
              dayIndex: dayIndex,
            );
          }),
        ),
        bottomSheet: FutureBuilder<List<UserGeneratedTripModel>>(
          future: HiveTripMethods.getAllTripsFromLocalDB(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SizedBox.shrink(); // Show nothing while loading
            }
            if (snapshot.hasData) {
              final savedTrips = snapshot.data!;
              final isTripSaved =
                  savedTrips.any((trip) => trip.id == widget.tripModel.id);
              if (!isTripSaved) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.grey[300]!, width: 1),
                    ),
                  ),
                  child: CustomGradientButton(
                    label: 'Save Trip',
                    onPressed: () {
                      HiveTripMethods.saveTripToLocalDB(widget.tripModel)
                          .then((value) {
                        SnackBarUtils.showSnackBar(
                            context, 'Trip saved successfully');
                      }).catchError(
                        (error) {
                          debugPrint(error.toString());
                          SnackBarUtils.showSnackBar(context, error.toString());
                        },
                      );
                    },
                  ),
                );
              }
            }
            return SizedBox.shrink(); // Show nothing if trip is already saved
          },
        ),
      ),
    );
  }
}

class DayWisePlanScreen extends StatelessWidget {
  final int dayIndex;
  final DaywisePlanModel daywisePlanModel;
  const DayWisePlanScreen(
      {super.key, required this.daywisePlanModel, required this.dayIndex});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:
            const EdgeInsets.only(left: 15, right: 15, bottom: 75, top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Text(
              daywisePlanModel.place,
              style: TextstyleConstants.titleTextStyle,
            ),
            Text(
              '6 Days Trip',
              style: TextstyleConstants.smallTextStyle3,
            ),
            RichText(
              text: TextSpan(
                text: "Day ${dayIndex + 1} ",
                style: TextstyleConstants.mediumTextStyle1,
                children: [
                  TextSpan(
                    text: "| ${formatDate(daywisePlanModel.planDateTime)}",
                    style: TextstyleConstants.smallTextStyle3,
                  )
                ],
              ),
            ),
            TripTimeline(poiList: daywisePlanModel.poiList),
          ],
        ),
      ),
    );
  }
}
