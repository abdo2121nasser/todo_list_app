import 'package:flutter/material.dart';
import 'package:todo_list_app/recourses/manager_files/color_manager.dart';
import 'package:todo_list_app/recourses/manager_files/values_manager.dart';



class TodoItemImageWidget extends StatelessWidget {
  final String image;
  const TodoItemImageWidget({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
      fit: BoxFit.fill,
      alignment: Alignment.center,
      errorBuilder: (context, error, stackTrace) {
        return  Icon(
          Icons.broken_image,
          size: AppVerticalSize.s80,  // You can adjust the size as needed
          color: kLightBlackColor,
        );
      },
    );
  }
}
