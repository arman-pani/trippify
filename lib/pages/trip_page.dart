import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:trippify/constants/colors_constants.dart';
import 'package:trippify/constants/textstyle_constants.dart';
import 'package:trippify/constants/theme_constants.dart';
import 'package:trippify/helpers/common_methods.dart';
import 'package:trippify/models/user_generated_trip_model.dart';
import 'package:trippify/pages/detailed_trip_page.dart';
import 'package:trippify/widgets/custom_gradient_button.dart';
import 'package:trippify/widgets/custom_icon_button.dart';
import 'package:trippify/widgets/white_container.dart';

class TripPage extends StatefulWidget {
  final UserGeneratedTripModel tripModel;
  const TripPage({super.key, required this.tripModel});

  @override
  State<TripPage> createState() => _TripPageState();
}

class _TripPageState extends State<TripPage> {
  @override
  Widget build(BuildContext context) {
    final outboundFlight = widget.tripModel.outboundFlightTicket;
    final returnFlight = widget.tripModel.returnFlightTicket;
    final outboundTrain = widget.tripModel.outboundTrainTicket;
    final returnTrain = widget.tripModel.returnTrainTicket;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      bottomSheet: Container(
        color: Colors.grey.shade100,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: CustomGradientButton(
          label: "View Itinerary",
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    DetailedTripPage(tripModel: widget.tripModel),
              ),
            );
          },
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.grey.shade100,
            title: Row(
              children: [
                CustomIconButton(
                    icon: Symbols.arrow_back_rounded,
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                Spacer(),
                CustomIconButton(icon: Symbols.share_rounded, onPressed: () {}),
                SizedBox(width: 10),
                CustomIconButton(
                    icon: Symbols.more_horiz_rounded, onPressed: () {}),
              ],
            ),
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                'https://picsum.photos/seed/picsum/200/300', // this image will replace the AppBar when scrolled
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(20.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: shadowList,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 5,
                    children: [
                      Text(
                        widget.tripModel.name,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      _detailRowWidget(
                        widget.tripModel.destination,
                        Symbols.location_on_rounded,
                      ),
                      _detailRowWidget(
                        '14 Dec 2025 - 17 Dec 2025',
                        Symbols.calendar_add_on_rounded,
                      ),
                      _detailRowWidget(
                        'Your budget: \$${widget.tripModel.budget}',
                        Symbols.money_bag_rounded,
                      ),
                      _detailRowWidget(
                        '${widget.tripModel.peopleCount} people',
                        Symbols.location_on_rounded,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                WhiteContainer(
                  title: "Description",
                  children: [
                    Text(
                      widget.tripModel.description,
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.1,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade500,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                WhiteContainer(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 5,
                      children: [
                        Text(
                          "${widget.tripModel.destination} -> ${widget.tripModel.destination}",
                          style: TextstyleConstants.titleTextStyle,
                        ),
                        _ticketRowWidget(
                          Symbols.flight_takeoff_rounded,
                          "${outboundFlight.airline} | ${outboundFlight.flightNumber}",
                          formatDate(outboundFlight.departureDateTime),
                          extractTimeFromDateTime(
                              outboundFlight.departureDateTime),
                          outboundFlight.price,
                        ),
                        _ticketRowWidget(
                          Symbols.train_rounded,
                          "${outboundTrain.trainName} | ${outboundTrain.trainNumber}",
                          formatDate(outboundTrain.departureDateTime),
                          extractTimeFromDateTime(
                              outboundTrain.departureDateTime),
                          outboundTrain.price,
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Text(
                      "${widget.tripModel.destination} <- ${widget.tripModel.destination}",
                      style: TextstyleConstants.titleTextStyle,
                    ),
                    _ticketRowWidget(
                      Symbols.flight_takeoff_rounded,
                      "${returnFlight.airline} | ${returnFlight.flightNumber}",
                      formatDate(returnFlight.departureDateTime),
                      extractTimeFromDateTime(returnFlight.departureDateTime),
                      returnFlight.price,
                    ),
                    _ticketRowWidget(
                      Symbols.train_rounded,
                      "${returnTrain.trainName} | ${returnTrain.trainNumber}",
                      formatDate(returnTrain.departureDateTime),
                      extractTimeFromDateTime(returnTrain.departureDateTime),
                      returnTrain.price,
                    )
                  ],
                ),
                SizedBox(height: 100),
              ]),
            ),
          )
        ],
      ),
    );
  }

  Widget _ticketRowWidget(
    IconData icon,
    String title,
    String date,
    String time,
    int cost,
  ) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: ColorsConstants.blueColor, shape: BoxShape.circle),
          child: Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: TextstyleConstants.mediumTextStyle1,
                  ),
                  Spacer(),
                  Text(
                    "\$${cost.toString()}",
                    style: TextstyleConstants.mediumTextStyle1,
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "$date | $time",
                    style: TextstyleConstants.smallTextStyle3,
                  ),
                  Spacer(),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _detailRowWidget(String title, IconData icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 30,
          color: Colors.grey.shade500,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.grey.shade500,
          ),
        ),
      ],
    );
  }
}
