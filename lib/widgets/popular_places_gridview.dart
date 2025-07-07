import 'package:flutter/material.dart';
import 'package:trippify/constants/dummy_data.dart';
import 'package:trippify/constants/textstyle_constants.dart';
import 'package:trippify/models/place_model.dart';

class PopularPlacesWidget extends StatelessWidget {
  PopularPlacesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: PageView.builder(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        controller: PageController(viewportFraction: 1.0),
        itemCount: (dummyPopularPlaces.length / 6).ceil(),
        itemBuilder: (context, pageIndex) {
          final startIndex = pageIndex * 6;
          final items = dummyPopularPlaces.sublist(
            startIndex,
            (startIndex + 6 > dummyPopularPlaces.length)
                ? dummyPopularPlaces.length
                : startIndex + 6,
          );

          return GridView.builder(
            clipBehavior: Clip.none,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 3,
            ),
            padding: EdgeInsets.all(0),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final place = dummyPopularPlaces[index];
              return PlaceCard(place: place);
            },
          );
        },
      ),
    );
  }
}

class PlaceCard extends StatelessWidget {
  final PlaceModel place;

  const PlaceCard({
    super.key,
    required this.place,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.white,
          backgroundImage: AssetImage(place.imagePath),
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              place.name,
              style: TextstyleConstants.mediumTextStyle1,
            ),
            Text(
              "${place.numberOfDestinations}+ destinations",
              style: TextstyleConstants.smallTextStyle1,
            )
          ],
        )
      ],
    );
  }
}
