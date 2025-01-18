import 'package:flutter/material.dart';
import 'package:trippify/constants/textstyle_constants.dart';

class PopularPlacesWidget extends StatelessWidget {
  final List<Map<String, String>> places = [
    {'name': 'Bali', 'destinations': '20+ destinations'},
    {'name': 'Yogyakarta', 'destinations': '20+ destinations'},
    {'name': 'Banjarbaru', 'destinations': '30+ destinations'},
    {'name': 'Surabaya', 'destinations': '20+ destinations'},
    {'name': 'Sukabumi', 'destinations': '20+ destinations'},
    {'name': 'Padang', 'destinations': '30+ destinations'},
    {'name': 'Bali', 'destinations': '20+ destinations'},
    {'name': 'Yogyakarta', 'destinations': '20+ destinations'},
    {'name': 'Banjarbaru', 'destinations': '30+ destinations'},
    {'name': 'Surabaya', 'destinations': '20+ destinations'},
    {'name': 'Sukabumi', 'destinations': '20+ destinations'},
    {'name': 'Padang', 'destinations': '30+ destinations'},
  ];

  PopularPlacesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: PageView.builder(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        controller: PageController(viewportFraction: 1.0),
        itemCount: (places.length / 6).ceil(),
        itemBuilder: (context, pageIndex) {
          final startIndex = pageIndex * 6;
          final items = places.sublist(
            startIndex,
            (startIndex + 6 > places.length) ? places.length : startIndex + 6,
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
              return PlaceCard(
                name: items[index]['name']!,
                destinations: items[index]['destinations']!,
              );
            },
          );
        },
      ),
    );
  }
}

class PlaceCard extends StatelessWidget {
  final String name;
  final String destinations;

  const PlaceCard({
    super.key,
    required this.name,
    required this.destinations,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.white,
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name,
              style: TextstyleConstants.mediumTextStyle1,
            ),
            Text(
              destinations,
              style: TextstyleConstants.smallTextStyle1,
            )
          ],
        )
      ],
    );
  }
}
