import 'package:flutter/material.dart';
import 'package:todo_list_app/recourses/manager_files/color_manager.dart';
import 'package:todo_list_app/recourses/manager_files/values_manager.dart';

class ExperienceLevelWidget extends StatelessWidget {
  final String selectedItem;
  final List<String> items;
final  Function(String) changeExperienceLevel;
  const ExperienceLevelWidget({super.key,
  required this.items,
    required this.selectedItem,
    required this.changeExperienceLevel
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding:  EdgeInsets.symmetric(horizontal: AppHorizontalSize.s14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppRadiusSize.s10),
        border: Border.all(color:kHintColor),
      ),
      child: DropdownButton<String>(
        isExpanded: true, // Makes the dropdown fill the container width
        value: selectedItem, // The currently selected item (null if none)
        underline: const SizedBox(), // Removes the default underline
        onChanged: (String? newValue) {
          if(newValue!=null) {
            changeExperienceLevel(newValue);
          }
        },
        items: items.map<DropdownMenuItem<String>>((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(), // Convert each string in _items to a DropdownMenuItem
      ),
    );
  }
}



