import 'package:flutter/material.dart';



class TodoItemImageWidget extends StatelessWidget {
  final String image;
  const TodoItemImageWidget({super.key,required this.image});

  @override
  Widget build(BuildContext context) {
    return Image.asset(image,fit: BoxFit.fill,);
  }
}
