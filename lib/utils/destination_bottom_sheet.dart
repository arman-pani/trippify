import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:trippify/constants/dummy_data.dart';
import 'package:trippify/constants/textstyle_constants.dart';
import 'package:trippify/models/place_predictition_model.dart';
import 'package:trippify/widgets/custom_gradient_button.dart';
import 'package:trippify/widgets/custom_textfield.dart';

void showDestinationModal(
  BuildContext context,
  TextEditingController destinationController,
) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (BuildContext context) {
      return DestinationBottomSheet(
        destinationController: destinationController,
      );
    },
  );
}

class DestinationBottomSheet extends StatefulWidget {
  final TextEditingController destinationController;
  const DestinationBottomSheet(
      {super.key, required this.destinationController});

  @override
  State<DestinationBottomSheet> createState() => _DestinationBottomSheetState();
}

class _DestinationBottomSheetState extends State<DestinationBottomSheet> {
  final TextEditingController searchController = TextEditingController();
  List<PlacePredictionModel> listOfSuggestions = [];

  @override
  void initState() {
    listOfSuggestions = recommmendedSuggestions;
    searchController.addListener(() {
      _onChange();
    });
    super.initState();
  }

  _onChange() {
    _placeSuggestions(searchController.text);
  }

  void _placeSuggestions(String input) async {
    final String apiKey = dotenv.env['PLACES_API_KEY'] ?? '';

    try {
      String url = dotenv.env['PLACES_API_URL'] ?? '';

      if (input.isEmpty) {
        setState(() {
          listOfSuggestions = recommmendedSuggestions;
        });
        return;
      }

      // Define the request body
      Map<String, dynamic> requestBody = {
        "input": input,
        "includedPrimaryTypes": [
          "country",
          "locality",
          "landmark",
        ],
      };

      // Make the POST request
      var response = await http.post(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          "X-Goog-Api-Key": apiKey,
        },
        body: json.encode(requestBody),
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        setState(() {
          listOfSuggestions = (data['suggestions'] as List)
              .map((suggestion) => PlacePredictionModel.fromMap(suggestion))
              .toList();
          debugPrint("List of Suggestions :${listOfSuggestions.toString()}");
        });
      } else {
        throw Exception('Failed to load suggestions: ${response.body}');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 15,
        children: [
          Row(
            children: [
              IconButton.filled(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.close),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.grey.shade200,
                ),
                color: Colors.black,
              ),
              Spacer(flex: 1),
              Text(
                'Travel Destination',
                style: TextstyleConstants.titleTextStyle,
              ),
              Spacer(flex: 2),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CustomTextfield(
              prefixIcon: Symbols.search_rounded,
              hintText: 'Where to?',
              labelText: '',
              controller: searchController,
            ),
          ),
          Visibility(
              child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: listOfSuggestions.length,
            itemBuilder: (context, index) {
              final placePrediction = listOfSuggestions[index];
              return GestureDetector(
                onTap: () {
                  setState(() {
                    debugPrint('Selected Place: ${placePrediction.text}');
                    debugPrint(
                        'Destination Controller: ${widget.destinationController}');

                    widget.destinationController.text = placePrediction.text;
                  });

                  Navigator.pop(context);
                },
                child: DestinationTile(
                  name: placePrediction.mainText,
                  region: placePrediction.secondaryText,
                  type: placePrediction.type,
                ),
              );
            },
          )),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomGradientButton(
              label: 'Confirm',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DestinationTile extends StatelessWidget {
  final String name;
  final String region;
  final String type;

  const DestinationTile({
    super.key,
    required this.name,
    required this.region,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      subtitle: Text(region),
      trailing: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: type == 'City' ? Colors.blue[100] : Colors.green[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          type,
          style: const TextStyle(color: Colors.black87),
        ),
      ),
    );
  }
}
