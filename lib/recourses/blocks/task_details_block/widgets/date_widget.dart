import 'package:flutter/material.dart';
import 'package:todo_list_app/recourses/manager_files/color_manager.dart';
import 'package:todo_list_app/recourses/manager_files/values_manager.dart';
import 'package:intl/intl.dart';

import '../../../manager_files/font_manager.dart';
import '../../../manager_files/style_manager.dart';

class DateWidget extends StatelessWidget {
  final DateTime dateTime;
  const DateWidget({super.key,required this.dateTime});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppHorizontalSize.s22),
      width: double.maxFinite,
      height: AppVerticalSize.s70,
      decoration: BoxDecoration(
          color: kLightIndigoColor,
          borderRadius: BorderRadius.circular(AppRadiusSize.s10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Updated At Date',
                style:
                    getRegularStyle(fontSize: FontSize.s12, color: kGreyColor),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                DateFormat('d MMMM, y').format(dateTime),
                style:
                    getRegularStyle(fontSize: FontSize.s16, color: kBlackColor),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          const Icon(
            Icons.calendar_month_rounded,
            color: kIndigoColor,
          )
        ],
      ),
    );
  }
}
