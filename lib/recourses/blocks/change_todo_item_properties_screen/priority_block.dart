import 'package:flutter/material.dart';
import 'package:todo_list_app/recourses/blocks/change_todo_item_properties_screen/widgets/priority_widget.dart';
import 'package:todo_list_app/recourses/blocks/change_todo_item_properties_screen/widgets/title_text_widget.dart';
import 'package:todo_list_app/recourses/manager_files/values_manager.dart';

import '../../manager_files/string_manager.dart';



class PriorityBlock extends StatelessWidget {
  final String selectedValue ;
  final Function(String) changeSelectedValueFunction;


const PriorityBlock({super.key,required this.selectedValue,
required this.changeSelectedValueFunction
});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment:CrossAxisAlignment.start,
      children: [
         TitleTextWidget(title: StringManager.ui.kPriorityWord),
        SizedBox(height: AppVerticalSize.s5,),
        PriorityWidget(selectedValue: selectedValue,
        changeSelectedValueFunction: (value){
          changeSelectedValueFunction(value);
        },
        )
      ],
    );
  }
}
