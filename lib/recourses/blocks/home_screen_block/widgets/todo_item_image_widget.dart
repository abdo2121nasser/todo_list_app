import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_app/recourses/manager_files/color_manager.dart';
import 'package:todo_list_app/recourses/manager_files/values_manager.dart';

class TodoItemImageWidget extends StatelessWidget {
  final String image;
  const TodoItemImageWidget({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _imageExists(image),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Icon(
            Icons.broken_image_rounded,
            size: AppVerticalSize.s80,
            color: kMixedGreyColor,
          );
        } else if (snapshot.hasData && snapshot.data == true) {
          // If image exists, show it
          return Image.network(image);
        } else {
          // If the image doesn't exist, show the asset image
          return Icon(
            Icons.broken_image_rounded,
            size: AppVerticalSize.s80,
            color: kMixedGreyColor,
          );
        }
      },
    );
  }

  Future<bool> _imageExists(String url) async {
    try {
      final response = await Dio().get(url);
      return (response.statusCode! >= 200 && response.statusCode! < 300); // Check if the image is valid
    } catch (e) {
      return false; // If any error occurs, return false
    }
  }
}
