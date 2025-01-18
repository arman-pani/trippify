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
    backgroundColor: Colors.white,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (BuildContext context) {
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
                controller: destinationController,
              ),
            ),
            ListView(
              shrinkWrap: true,
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
