import 'package:flutter/material.dart';

import '../../../manager_files/color_manager.dart';
import '../../../manager_files/font_manager.dart';
import '../../../manager_files/style_manager.dart';
import '../../../manager_files/values_manager.dart';



class ShowTextWidget extends StatelessWidget {
  final bool hasFlag;
  final String text;
  const ShowTextWidget({super.key,required this.text,required this.hasFlag});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,

      padding: EdgeInsets.symmetric(horizontal: AppHorizontalSize.s22),
      width: double.maxFinite,
      height: AppVerticalSize.s70,
      decoration: BoxDecoration(
          color: kLightIndigoColor,
          borderRadius: BorderRadius.circular(AppRadiusSize.s10)),
      child:  Row(
        children: [
         hasFlag? Icon(Icons.outlined_flag_sharp,color: kIndigoColor,size: FontSize.s18,):SizedBox.shrink(),
          hasFlag?  SizedBox(width: AppHorizontalSize.s5,):SizedBox.shrink(),
          Text(
            text,
            style:
            getBoldStyle(fontSize: FontSize.s16, color: kIndigoColor),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
