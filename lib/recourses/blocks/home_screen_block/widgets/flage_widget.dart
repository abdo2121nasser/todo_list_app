import 'package:flutter/material.dart';

import '../../../manager_files/color_manager.dart';
import '../../../manager_files/font_manager.dart';
import '../../../manager_files/style_manager.dart';




class FlagWidget extends StatelessWidget {
  const FlagWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.outlined_flag_sharp,color: kOrangeColor,size: FontSize.s18,),
        Text(
          'low',
          style: getMediumStyle(fontSize: FontSize.s12, color: kOrangeColor),
        ),      ],
    );
  }
}
