import 'package:flutter/material.dart';
import 'package:todo_list_app/recourses/manager_files/values_manager.dart';

import '../../../manager_files/color_manager.dart';
import '../../../manager_files/font_manager.dart';
import '../../../manager_files/string_manager.dart';
import '../../../manager_files/style_manager.dart';




class FlagWidget extends StatelessWidget {
  final String priority;

  const FlagWidget({super.key,required this.priority});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.outlined_flag_sharp,color: _getColor,size: FontSize.s18,),
        SizedBox(width: AppHorizontalSize.s5,),
        Text(
          priority,
          style: getMediumStyle(fontSize: FontSize.s12, color: _getColor),
        ),      ],
    );
  }
  get _getColor {
    if (priority == StringManager.ui.kHighWord) {
      return kOrangeColor;
    } else if (priority == StringManager.ui.kMediumWord) {
      return kIndigoColor;
    } else {
      return kBlueColor;
    }
  }
}
