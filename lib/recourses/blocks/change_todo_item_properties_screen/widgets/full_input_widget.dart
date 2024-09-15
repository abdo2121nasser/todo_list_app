import 'package:flutter/material.dart';
import 'package:todo_list_app/recourses/blocks/change_todo_item_properties_screen/widgets/title_text_widget.dart';
import 'package:todo_list_app/recourses/manager_files/values_manager.dart';

import '../../general_blocks/general_text_form_field.dart';



class FullInputWidget extends StatelessWidget {
  final bool multiLine;
  final String hint;
  final String title;
  final TextEditingController controller;
  final Icon? suffixIcon;
  final VoidCallback? suffixIconFunction;
  const FullInputWidget({super.key,
  required this.controller,
    required this.multiLine,
    required this.hint,
    required this.title,
    this.suffixIcon,
    this.suffixIconFunction
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
         TitleTextWidget(title: title),
        SizedBox(height: AppVerticalSize.s8,),
        Container(
           constraints: BoxConstraints(
             maxHeight: AppVerticalSize.s150
           ),
          child: GeneralTextFormField(controller:controller,
            hint: hint,
            multiLine: multiLine,
            suffixIcon: suffixIcon,
            suffixIconFunction:(){
            suffixIconFunction!();
            },
          ),
        )
      ],
    );
  }
}
