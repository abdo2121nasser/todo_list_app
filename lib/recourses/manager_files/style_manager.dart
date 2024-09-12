import 'package:flutter/material.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(
    double fontSize, Color color, String fontFamily, FontWeight fontWeight,
    bool hasUnderLine
    ) {
  return TextStyle(
      overflow: TextOverflow.ellipsis,
      color: color,
      fontSize: fontSize,
      fontFamily: fontFamily,
      decoration:hasUnderLine? TextDecoration.underline:null,
      fontWeight: fontWeight);
}

// bold font
TextStyle getBoldStyle(
    {required double fontSize,
    required Color color,
      bool hasUnderLine=false,
    String fontFamily = FontFamily.kDmSans}) {
  return _getTextStyle(fontSize, color, fontFamily, FontWeightManager.bold,hasUnderLine);
}

// medium font
TextStyle getMediumStyle(
    {required double fontSize,
    required Color color,
      bool hasUnderLine=false,
    String fontFamily = FontFamily.kDmSans}) {
  return _getTextStyle(fontSize, color, fontFamily, FontWeightManager.medium,hasUnderLine);
}

// regular font
TextStyle getRegularStyle(
    {required double fontSize,
    required Color color,
      bool hasUnderLine=false,
      String fontFamily = FontFamily.kDmSans}) {
  return _getTextStyle(fontSize, color, fontFamily, FontWeightManager.regular,hasUnderLine);
}

// semiBold font
TextStyle getSemiRegularStyle(
    {required double fontSize,
    required Color color,
      bool hasUnderLine=false,
    String fontFamily = FontFamily.kDmSans}) {
  return _getTextStyle(
      fontSize, color, fontFamily, FontWeightManager.semiRegular,hasUnderLine);
}
