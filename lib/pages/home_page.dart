import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:trippify/constants/colors_constants.dart';
import 'package:trippify/constants/textstyle_constants.dart';
import 'package:trippify/widgets/home_search_bar.dart';
import 'package:trippify/widgets/popular_places_gridview.dart';
import 'package:trippify/widgets/recommended_trip_list_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorsConstants.blueColor,
        onPressed: () {},
        child: Icon(
          Symbols.robot_2_rounded,
          color: Colors.white,
          size: 30,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: double.infinity,
                      height: maxHeight * 0.5,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/home_bg_image.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 100),
                        child: Text(
                          "Start Trippin'\nOn Adventures",
                          textAlign: TextAlign.center,
                          style: TextstyleConstants.titleTextStyle1,
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 25,
                      color: Colors.grey.shade100,
                    )
                  ],
                ),
                Positioned(
                  bottom: 0,
                  left: 25,
                  right: 25,
                  child: HomeSearchBar(),
                )
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 25,
              children: [
                tripDetailsContainer('Hotel', Symbols.apartment_rounded),
                tripDetailsContainer('Flight', Symbols.travel_rounded),
                tripDetailsContainer('Train', Symbols.train_rounded),
                tripDetailsContainer('Experience', Symbols.festival_rounded),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Popular Places',
                    style: TextstyleConstants.titleTextStyle,
                  ),
                  SizedBox(height: 10),
                  PopularPlacesWidget()
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Recommended Trips',
                    style: TextstyleConstants.titleTextStyle,
                  ),
                  SizedBox(height: 10),
                  RecommendedTripListView(),
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget tripDetailsContainer(String title, IconData icon) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 30,
          child: Icon(
            icon,
            color: Colors.black,
            size: 24,
            fill: 1,
          ),
        ),
        SizedBox(height: 5),
        Text(
          title,
          style: TextstyleConstants.smallTextStyle2
              .copyWith(fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
