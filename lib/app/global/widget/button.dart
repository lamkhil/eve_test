import 'package:eve_test/app/global/constant/theme.dart';
import 'package:flutter/material.dart';

class ButtonApp {
  ButtonApp._();

  static Widget outline(
      {required Function() onPressed, required Widget child}) {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
            backgroundColor: Colors.transparent,
            side: const BorderSide(color: ColorsApp.purple, width: 0.5),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))),
        onPressed: onPressed,
        child: child);
  }

  static Widget basic({required Function() onPressed, required Widget child}) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32))),
        onPressed: onPressed,
        child: child);
  }
}
