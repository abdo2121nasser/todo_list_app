import 'package:flutter/material.dart';
import 'package:todo_list_app/recourses/manager_files/color_manager.dart';
import 'package:todo_list_app/recourses/manager_files/style_manager.dart';
import 'package:todo_list_app/recourses/manager_files/values_manager.dart';

import 'font_manager.dart';

ThemeData getAppTheme() {
  return ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: kWhiteColor,
        elevation: 0,

        //actionsIconTheme: IconThemeData(color: ColorManager.kPurpleColor)
      ),
      // bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: ColorManager.kLightPurpleColor,),
      scaffoldBackgroundColor: kWhiteColor,
      inputDecorationTheme: InputDecorationTheme(
          contentPadding: EdgeInsets.symmetric(
              horizontal: AppHorizontalSize.s16, vertical: AppVerticalSize.s5),
          hintStyle: getRegularStyle(
            fontSize: FontSize.s14,
            color: kHintColor,
          ),
          fillColor: kWhiteColor,
          filled: true,
          // labelStyle:
          //     getRegularStyle(fontSize: FontSize.s14, color: kHintColor),
          enabledBorder: OutlineInputBorder(
              borderSide:  BorderSide(color:kHintColor,width: AppHorizontalSize.s1_5),

              borderRadius:
                  BorderRadius.all(Radius.circular(AppRadiusSize.s10))),
          focusedBorder: OutlineInputBorder(
                  borderSide:  BorderSide(color:kHintColor,width: AppHorizontalSize.s1_5),
              borderRadius:
                  BorderRadius.all(Radius.circular(AppRadiusSize.s10)))),
      // buttonTheme: ButtonThemeData(
      // shape:StadiumBorder()
      //)
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppRadiusSize.s10),
                  side: BorderSide(color: kWhiteColor, width: FontSize.s1)))));

}
