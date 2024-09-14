import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_list_app/recourses/manager_files/color_manager.dart';
import 'package:todo_list_app/recourses/manager_files/toast_massage_manager.dart';
import 'package:todo_list_app/recourses/manager_files/values_manager.dart';

import '../../../manager_files/font_manager.dart';
import '../../../manager_files/style_manager.dart';
import 'content_information_widget.dart';

class PersonalInformationContainerWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final bool canBeCopy;
  const PersonalInformationContainerWidget(
      {super.key, required this.title, required this.subTitle,
      required this.canBeCopy
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: AppVerticalSize.s90,
      margin: EdgeInsets.symmetric(horizontal: AppHorizontalSize.s16),
      padding: EdgeInsets.symmetric(horizontal: AppHorizontalSize.s12),
      decoration: BoxDecoration(
          color: kLightGreyColor,
          borderRadius: BorderRadius.circular(AppRadiusSize.s14)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ContentInformationWidget(
            title: title,
            subTitle: subTitle,
          ),
          canBeCopy?
          InkWell(
              onTap: () async {
                _copyToClipboard();
              },
              child: const Icon(Icons.copy,
              color: kIndigoColor,
              )):
              const SizedBox()
        ],
      ),
    );
  }

  void _copyToClipboard() {
    Clipboard.setData(ClipboardData(text: subTitle));
    getToastMessage(message: 'copied');
  }
}
