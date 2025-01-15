import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:trippify/constants/textstyle_constants.dart';
import 'package:trippify/widgets/custom_gradient_button.dart';
import 'package:trippify/widgets/custom_textfield.dart';

void showDestinationModal(
  BuildContext context,
  TextEditingController destinationController,
) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (BuildContext context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 8),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Travel Destination',
              style: TextstyleConstants.titleTextStyle,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomTextfield(
              prefixIcon: Symbols.search_rounded,
              hintText: 'Where to?',
              labelText: '',
              controller: destinationController,
            ),
          ),
          Expanded(
            child: ListView(
              children: const [
                DestinationTile(
                  name: 'Bandung',
                  region: 'West Java, Indonesia',
                  type: 'City',
                ),
                DestinationTile(
                  name: 'Dago',
                  region: 'Bandung, West Java, Indonesia',
                  type: 'Area',
                ),
                DestinationTile(
                  name: 'Denpasar',
                  region: 'Bali, Indonesia',
                  type: 'City',
                ),
                DestinationTile(
                  name: 'Palembang',
                  region: 'South Sumatra, Indonesia',
                  type: 'City',
                ),
                DestinationTile(
                  name: 'Kuala Lumpur',
                  region: 'WPKL, Malaysia',
                  type: 'City',
                ),
              ],
            ),
          ),
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
      );
    },
  );
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
