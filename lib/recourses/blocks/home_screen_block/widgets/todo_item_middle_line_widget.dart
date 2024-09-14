import 'package:flutter/material.dart';

import '../../../manager_files/color_manager.dart';
import '../../../manager_files/font_manager.dart';
import '../../../manager_files/style_manager.dart';




class TodoItemMiddleLine extends StatelessWidget {
  const TodoItemMiddleLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Text(
        'This application is designed for super shops. By using ',
        style: getRegularStyle(fontSize: FontSize.s14, color: kMixedGreyColor),
      ),
    )

    ;
  }
}
