import 'package:flutter/material.dart';
import 'package:todo_list_app/recourses/manager_files/color_manager.dart';
import 'package:intl/intl.dart';
import '../../../manager_files/font_manager.dart';
import '../../../manager_files/style_manager.dart';
import 'flage_widget.dart';

class TodoItemLastLineWidget extends StatelessWidget {
  final String priority;
  DateTime dateTime;
  TodoItemLastLineWidget(
      {super.key, required this.priority, required this.dateTime});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FlagWidget(priority: priority),
        Text(
          DateFormat('dd/MM/yyyy').format(dateTime),
          style:
              getRegularStyle(fontSize: FontSize.s12, color: kMixedGreyColor),
        )
      ],
    );
  }
}
