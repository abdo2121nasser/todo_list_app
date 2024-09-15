import 'package:flutter/material.dart';
import 'package:todo_list_app/recourses/manager_files/image_manager.dart';
import 'package:todo_list_app/recourses/manager_files/string_manager.dart';

import '../../../manager_files/color_manager.dart';
import '../../../manager_files/font_manager.dart';
import '../../../manager_files/style_manager.dart';
import '../../../manager_files/values_manager.dart';

class PriorityWidget extends StatelessWidget {
   PriorityWidget({super.key,
   required this.selectedValue,
     required this.changeSelectedValueFunction
   });
   final Function(String) changeSelectedValueFunction;

  final List<String> _items = [
    StringManager.ui.kHighWord,
    StringManager.ui.kMediumWord,
    StringManager.ui.kLowWord,
  ];

 final String selectedValue ;
 // Default selected value
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: AppHorizontalSize.s22),
      decoration: BoxDecoration(
        color: kLightIndigoColor,
        borderRadius: BorderRadius.circular(AppRadiusSize.s10),
        border: Border.all(color: kLightIndigoColor,width: 0),
      ),
      child: DropdownButton<String>(
        isExpanded: true, // Makes the dropdown fill the container width
        value: selectedValue, // The currently selected item
        underline: const SizedBox(), // Removes the default underline
        onChanged: (String? newValue) {
          if (newValue != null) {
          changeSelectedValueFunction(newValue);
          }
        },
        icon: Image.asset(ImageManager.kDownArrowImage, width: AppHorizontalSize.s14),
        items: _items.map<DropdownMenuItem<String>>((String item) {
          bool isSelected = item == selectedValue;
          return DropdownMenuItem<String>(
            value: item,
            child: Row(
              children: [
                Icon(Icons.outlined_flag, color:  isSelected ? kIndigoColor:kGreyColor), // Icon color
                SizedBox(width: AppHorizontalSize.s5),
                Text(
                  item + ' ' + StringManager.ui.kPriorityWord,
                  style: getBoldStyle(
                    fontSize: FontSize.s16,
                    color: isSelected ? kIndigoColor:kGreyColor, // Text color
                  ),
                ),
              ],
            ),
          );
        }).toList(), // Convert each string in items to a DropdownMenuItem
      ),
    );
  }
}
