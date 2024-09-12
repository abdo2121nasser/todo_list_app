import 'package:flutter/material.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(
    double fontSize, Color color, String fontFamily, FontWeight fontWeight) {
  return TextStyle(
      overflow: TextOverflow.ellipsis,
      color: color,
      fontSize: fontSize,
      fontFamily: fontFamily,
      fontWeight: fontWeight);
}

// bold font
TextStyle getBoldStyle(
    {required double fontSize,
    required Color color,
    String fontFamily = FontFamily.kDmSans}) {
  return _getTextStyle(fontSize, color, fontFamily, FontWeightManager.bold);
}

// medium font
TextStyle getMediumStyle(
    {required double fontSize,
    required Color color,
    String fontFamily = FontFamily.kDmSans}) {
  return _getTextStyle(fontSize, color, fontFamily, FontWeightManager.medium);
}

// regular font
TextStyle getRegularStyle(
    {required double fontSize,
    required Color color,
    String fontFamily = FontFamily.kDmSans}) {
  return _getTextStyle(fontSize, color, fontFamily, FontWeightManager.regular);
}

// semiBold font
TextStyle getSemiRegularStyle(
    {required double fontSize,
    required Color color,
    String fontFamily = FontFamily.kDmSans}) {
  return _getTextStyle(
      fontSize, color, fontFamily, FontWeightManager.semiRegular);
}
