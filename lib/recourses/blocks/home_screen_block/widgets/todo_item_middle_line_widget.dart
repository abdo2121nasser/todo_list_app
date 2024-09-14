import 'package:flutter/material.dart';

import '../../../manager_files/color_manager.dart';
import '../../../manager_files/font_manager.dart';
import '../../../manager_files/style_manager.dart';

class TodoItemMiddleLine extends StatelessWidget {
  final String description;
  const TodoItemMiddleLine({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: getRegularStyle(fontSize: FontSize.s14, color: kMixedGreyColor),
    );
  }
}
