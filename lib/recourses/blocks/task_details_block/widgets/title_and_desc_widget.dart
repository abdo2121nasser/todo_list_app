import 'package:flutter/material.dart';
import 'package:todo_list_app/recourses/manager_files/values_manager.dart';
import '../../../manager_files/color_manager.dart';
import '../../../manager_files/font_manager.dart';
import '../../../manager_files/style_manager.dart';

class TitleAndDescWidget extends StatelessWidget {
  final String title;
  final String description;
  const TitleAndDescWidget(
      {super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: getBoldStyle(fontSize: FontSize.s24, color: kBlackColor),
            textAlign: TextAlign.start,
            overflow: TextOverflow.visible,
          ),
          SizedBox(height: AppVerticalSize.s5),
          // Description section
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                description,
                style:
                    getRegularStyle(fontSize: FontSize.s14, color: kBlackColor),
                textAlign: TextAlign.start,
                overflow: TextOverflow.visible,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
