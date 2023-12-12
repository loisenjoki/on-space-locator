import 'package:flutter/material.dart';
import 'colors.dart';

class CustomTextStyles {
  static TextStyle get meddiumLarge => const TextStyle(
      fontFamily: 'Lato',
      color:black,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      letterSpacing: .1);
  static TextStyle get textLarge => const TextStyle(
      fontFamily: 'Lato',
      fontSize: 14,
      letterSpacing: 2,
      fontWeight: FontWeight.bold,
      color: textBlack);

  static TextStyle get normalText => const TextStyle(
      fontFamily: 'Lato',
      fontSize: 14,
      letterSpacing: 2,
      color: textBlack);

  static TextStyle get hintText =>
      const TextStyle(fontFamily: 'Quicksand', color: Colors.grey, fontSize: 15);


  static TextStyle get smallText => const TextStyle(
      fontFamily: 'Lato',
      fontSize: 12,
      letterSpacing: 2,
      color: textBlack);


}