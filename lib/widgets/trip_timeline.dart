import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:timelines_plus/timelines_plus.dart';
import 'package:trippify/constants/textstyle_constants.dart';
import 'package:trippify/helpers/common_methods.dart';
import 'package:trippify/models/daywise_plan_model.dart';

class TripTimeline extends StatelessWidget {
  final List<POIModel> poiList;

  const TripTimeline({super.key, required this.poiList});

  @override
  Widget build(BuildContext context) {
    return Timeline.tileBuilder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      builder: TimelineTileBuilder.fromStyle(
        itemCount: poiList.length,
        indicatorStyle: IndicatorStyle.outlined,
        connectorStyle: ConnectorStyle.dashedLine,
        nodePositionBuilder: (context, index) => 0.0,
        indicatorPositionBuilder: (context, index) => 0.05,
        contentsAlign: ContentsAlign.basic,
        contentsBuilder: (context, index) {
          final poi = poiList[index];
          return Padding(
            padding: const EdgeInsets.only(left: 15, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  decoration: BoxDecoration(
                    border: Border.fromBorderSide(
                        BorderSide(color: Colors.grey, width: 1)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                      "${formatTimeOfDay(poi.startTime)} - ${formatTimeOfDay(poi.endTime)}",
                      softWrap: false),
                ),
                SizedBox(height: 15),
                poiDetailCard(
                  poi.placeToVisit,
                  poi.totalTimeToCover,
                  poi.costPerPerson,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget poiDetailCard(String place, int totalTimeToCover, int costPerPerson) {
    return Container(
      padding: EdgeInsets.only(left: 20, bottom: 30, top: 15, right: 20),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        boxShadow: [
          BoxShadow(
            color: Colors.blue.shade100,
            spreadRadius: 0.1,
            blurRadius: 4,
            offset: const Offset(0, 0),
          )
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 3,
        children: [
          Text(
            place,
            style: TextstyleConstants.titleTextStyle,
          ),
          Row(
            children: [
              Icon(
                Symbols.timer_rounded,
                size: 20,
                color: Colors.grey,
              ),
              SizedBox(width: 5),
              Text(
                "$totalTimeToCover hour in location",
                style: TextstyleConstants.smallTextStyle1,
              ),
            ],
          ),
          RichText(
            text: TextSpan(
              text: "Start from ",
              style: TextstyleConstants.smallTextStyle1,
              children: [
                TextSpan(
                  text: "\$$costPerPerson (Foreigner)",
                  style: TextstyleConstants.mediumTextStyle1,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
