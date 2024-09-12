import 'package:flutter/material.dart';

import '../../../manager_files/color_manager.dart';
import '../../../manager_files/font_manager.dart';
import '../../../manager_files/style_manager.dart';



class ContentInformationWidget extends StatelessWidget {
  final String title;
  final String subTitle;

  const ContentInformationWidget({super.key,
  required this.title,
    required this.subTitle
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.toUpperCase(),
          style: getMediumStyle(
            fontSize: FontSize.s12,
            color: kMixedGreyColor,
          ),),
        Text(
          subTitle,
          style: getBoldStyle(
            fontSize: FontSize.s18,
            color: kMixedGreyColor,
          ),),
      ],
    );
  }
}
