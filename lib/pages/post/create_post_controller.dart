import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trippify/constants/app_constants.dart';
import 'package:trippify/constants/textstyle_constants.dart';
import 'package:trippify/widgets/mutli_select_preferences.dart';

class CreatePostController extends GetxController {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final ImagePicker imagePicker = ImagePicker();

  List<String> selectedTags = [];
  List<XFile> selectedImages = [];

  void selectImages() async {
    final List<XFile> images = await imagePicker.pickMultiImage();
    if (images.isNotEmpty) {
      selectedImages.addAll(images);
      update();
    }
  }

  void selectTags(BuildContext context) {
    showModalBottomSheet(
      isDismissible: false,
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(15),
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                spacing: 5,
                children: [
                  Icon(Icons.tag_rounded),
                  Text(
                    'Select Tags',
                    style: TextstyleConstants.titleTextStyle,
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      context.pop();
                      update();
                    },
                    icon: Icon(Icons.close),
                  )
                ],
              ),
              MutliSelectPreferences(
                items: tags,
                selectedItems: selectedTags,
                onChange: (selectedItems) {
                  selectedTags.clear();
                  selectedTags.addAll(selectedItems);
                  debugPrint(selectedTags.toString());
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
