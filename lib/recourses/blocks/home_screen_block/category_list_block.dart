import 'package:flutter/material.dart';
import 'package:todo_list_app/recourses/blocks/home_screen_block/widgets/category_widget.dart';
import 'package:todo_list_app/recourses/manager_files/values_manager.dart';

class CategoryListBlock extends StatelessWidget {
  const CategoryListBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppVerticalSize.s65,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(vertical: AppVerticalSize.s10),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>
            const CategoryWidget(), // Use CategoryWidget here
        separatorBuilder: (context, index) =>
            SizedBox(width: AppHorizontalSize.s5),
        itemCount: 4, // Adjust the itemCount if needed
      ),
    );
  }
}
