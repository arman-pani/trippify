import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddedImagesCarousel extends StatefulWidget {
  final List<XFile> selectedImages;
  const AddedImagesCarousel({super.key, required this.selectedImages});

  @override
  State<AddedImagesCarousel> createState() => _AddedImagesCarouselState();
}

class _AddedImagesCarouselState extends State<AddedImagesCarousel> {
  late List<Widget> _pages;

  int _activePage = 0;

  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();

    _pages = List.generate(
      widget.selectedImages.length,
      (index) => Image.file(
        File(widget.selectedImages[index].path),
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 225,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.selectedImages.length,
            onPageChanged: (value) {
              setState(() {
                _activePage = value;
              });
            },
            itemBuilder: (context, index) {
              return _pages[index];
            },
          ),
        ),
        Positioned(
          bottom: 10,
          right: 0,
          left: 0,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: List<Widget>.generate(
              _pages.length,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: InkWell(
                  onTap: () {
                    _pageController.animateToPage(
                      index,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  },
                  child: CircleAvatar(
                    radius: 4,
                    backgroundColor:
                        _activePage == index ? Colors.white : Colors.grey,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
