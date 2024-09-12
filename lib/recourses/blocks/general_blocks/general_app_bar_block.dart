import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_app/recourses/manager_files/color_manager.dart';
import 'package:todo_list_app/recourses/manager_files/image_manager.dart';
import 'package:todo_list_app/recourses/manager_files/values_manager.dart';

import '../../manager_files/font_manager.dart';
import '../../manager_files/style_manager.dart';

class GeneralAppBarBlock extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final List<Widget> actions;
  final Color backgroundColor;
  final Color titleColor;
  final VoidCallback? titleFunction;
  final bool centerTitle;
  final bool haveReturnArrow;

  const GeneralAppBarBlock(
      {super.key,
      required this.title,
      this.actions = const [],
      this.titleFunction,
      this.centerTitle = false,
      this.haveReturnArrow = true,
      this.titleColor = kBlackColor,
      this.backgroundColor = kWhiteColor});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      leadingWidth: 0,
      automaticallyImplyLeading: false,
      centerTitle: centerTitle,
      title: InkWell(
        onTap: haveReturnArrow
            ? () {
                if (titleFunction == null) {
                  Get.back();
                } else {
                  titleFunction!();
                }
              }
            : null,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            haveReturnArrow
                ? Image.asset(ImageManager.kArrowImage)
                : const SizedBox(),
            SizedBox(
              width: AppHorizontalSize.s5,
            ),
            Flexible(
              child: Text(
                title,
                style: getBoldStyle(
                  fontSize: FontSize.s24,
                  color: titleColor,
                ),
              ),
            ),
          ],
        ),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
