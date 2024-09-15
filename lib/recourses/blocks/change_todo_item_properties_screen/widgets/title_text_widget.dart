import 'package:flutter/material.dart';

import '../../../manager_files/color_manager.dart';
import '../../../manager_files/font_manager.dart';
import '../../../manager_files/string_manager.dart';
import '../../../manager_files/style_manager.dart';




class TitleTextWidget extends StatelessWidget {
  final String title;
  const TitleTextWidget({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return  Text(
        title,
        style: getRegularStyle(
        fontSize: FontSize.s12,
        color: kGreyColor,
    ));
  }
}
