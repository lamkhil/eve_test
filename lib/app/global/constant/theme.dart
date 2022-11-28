import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColorsApp {
  ColorsApp._();

  static const purple = Color(0xFF6A45D2);
  static const white = Colors.white;
  static const orange = Color(0xFFF34F29);
  static const blue = Color(0xFF4765FF);
  static const blue2 = Color(0xFF10CEDA);
  static const green = Color(0xFF18A642);
  static const yellow = Color(0xFFFD9B2B);
  static const backgroundColor = Color(0xFFF6F8FD);
  static const grey = Color(0xFF8A92A6);
  static const darkBlue = Color(0xFF223263);

  static final whiteOpacity = Colors.white.withOpacity(0.2);
}

class ThemeApp {
  ThemeApp._();

  static final theme = ThemeData(
      primaryColor: ColorsApp.purple,
      colorScheme: const ColorScheme.light(primary: ColorsApp.purple),
      inputDecorationTheme: InputDecorationTheme(
          hintStyle: Get.textTheme.subtitle1!
              .copyWith(color: ColorsApp.grey, fontWeight: FontWeight.w100),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: ColorsApp.grey.withOpacity(0.2))),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: ColorsApp.grey.withOpacity(0.2))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: ColorsApp.purple.withOpacity(0.2))),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.red.withOpacity(0.2)))),
      textTheme: TextTheme(
        headline1: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: ColorsApp.darkBlue),
        headline2: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: ColorsApp.darkBlue),
        headline3: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: ColorsApp.darkBlue),
        headline4: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: ColorsApp.darkBlue),
        headline5: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
            color: ColorsApp.darkBlue),
        headline6: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.normal,
            color: ColorsApp.darkBlue),
        bodyText1: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.normal),
        bodyText2: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.normal),
        subtitle1: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w100),
      ));
}
