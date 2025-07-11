import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:trippify/constants/colors_constants.dart';
import 'package:trippify/pages/post/create_post_controller.dart';
import 'package:trippify/pages/post/widgets/added_images_carousel.dart';

class CreatePostPage extends StatelessWidget {
  const CreatePostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Post'),
      ),
      body: GetBuilder<CreatePostController>(
          init: CreatePostController(),
          builder: (controller) {
            return Column(
              spacing: 15,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    maxLines: 1,
                    maxLength: 60,
                    controller: controller.titleController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Title',
                      counterText: "",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 24,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                tagListView(controller.selectedTags),
                if (controller.selectedImages.isNotEmpty)
                  AddedImagesCarousel(
                      selectedImages: controller.selectedImages),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: controller.descriptionController,
                    maxLines: 5,
                    maxLength: 250,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Add description',
                      counterText: "",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    IconButton(
                      onPressed: controller.selectImages,
                      icon: Icon(Icons.add_photo_alternate_rounded),
                    ),
                    IconButton(
                      onPressed: () => controller.selectTags(context),
                      icon: Icon(Icons.tag_rounded),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.attach_money_rounded),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.airplane_ticket_rounded),
                    ),
                  ],
                )
              ],
            );
          }),
    );
  }

  SizedBox tagListView(List<String> selectedItems) {
    return SizedBox(
      height: 25,
      child: ListView.separated(
        itemCount: selectedItems.length,
        scrollDirection: Axis.horizontal,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 15),
        itemBuilder: (context, index) {
          final item = selectedItems[index];
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: ColorsConstants.blueColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
                child: Text(
              item,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            )),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 7),
      ),
    );
  }
}
