import 'package:eve_test/app/global/constant/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFormWithLabel extends StatelessWidget {
  final String label;
  final bool obscureText;
  final bool isImportance;
  final TextEditingController? controller;
  final Widget? prefix;
  final Widget? suffix;
  final String? hint;
  final bool enable;
  const TextFormWithLabel(
      {super.key,
      required this.label,
      this.suffix,
      this.controller,
      this.hint,
      this.isImportance = false,
      this.obscureText = false,
      this.enable = true,
      this.prefix});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(label,
                  style:
                      Get.textTheme.bodyText1!.copyWith(color: ColorsApp.grey)),
              isImportance
                  ? Text(
                      "*",
                      style: Get.textTheme.bodyText2!.copyWith(
                        color: Colors.red,
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
        TextFormField(
          obscureText: obscureText,
          controller: controller,
          enabled: enable,
          decoration: InputDecoration(
              filled: true,
              prefixIcon: prefix,
              suffixIcon: suffix,
              hintText: hint),
        )
      ],
    );
  }
}
