import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_app/recourses/manager_files/color_manager.dart';
import 'package:todo_list_app/recourses/manager_files/image_manager.dart';
import 'package:todo_list_app/recourses/manager_files/string_manager.dart';
import 'package:todo_list_app/recourses/manager_files/values_manager.dart';

import '../../../manager_files/font_manager.dart';
import '../../../manager_files/style_manager.dart';

class PickImageWidget extends StatelessWidget {
  final VoidCallback pickImage;
  final File? imageFile;
  const PickImageWidget(
      {super.key, required this.pickImage, required this.imageFile});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: kIndigoColor, // The color of the border
      strokeWidth: 1.5, // The width of the border
      dashPattern: const [4, 4], // Length of dashes and gaps
      borderType: BorderType.RRect,
      radius: Radius.circular(AppRadiusSize.s18), // Round corners for RRect
      child: InkWell(
        onTap: () {
          pickImage();
        },
        child: Container(
          constraints: BoxConstraints(
              minWidth: double.maxFinite,
              minHeight: AppVerticalSize.s60,
              maxHeight: AppVerticalSize.s150),
          width: double.maxFinite,
          decoration: imageFile != null
              ? BoxDecoration(
                  image: DecorationImage(image: Image.file(imageFile!,
                 fit: BoxFit.fill,
                  ).image))
              : null,
          //   height: AppVerticalSize.s60,
          child: imageFile == null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(ImageManager.kAddPhotoImage),
                    SizedBox(
                      width: AppHorizontalSize.s5,
                    ),
                    Text(
                      StringManager.ui.kAddNewImageWord,
                      style: getMediumStyle(
                        fontSize: FontSize.s18,
                        color: kIndigoColor,
                      ),
                    )
                  ],
                )
              : null,
        ),
      ),
    );
  }
}
