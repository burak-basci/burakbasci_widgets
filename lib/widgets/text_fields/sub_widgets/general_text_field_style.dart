import 'package:flutter/material.dart';
import 'package:get/get.dart';

InputDecoration textfieldStyle({
  required IconData? prefixIcon,
  required String labelText,
  required Color? contentColor,
  required Color? borderColor,
  required BorderRadius? borderRadius,
  required bool isPasswordField,
  required bool showPassword,
  required Widget? suffix,
  required Widget? prefix,
  required void Function()? onPressed,
}) {
  return InputDecoration(
    prefix: prefix,
    prefixIcon:
        prefixIcon != null
            ? Icon(
              prefixIcon,
              color: contentColor ?? Colors.grey.shade400,
              size: 22,
            )
            : null,
    labelText: labelText,
    labelStyle: TextStyle(
      color: contentColor ?? Colors.grey.shade400,
      fontSize: 16,
    ),
    alignLabelWithHint: true,
    suffix: suffix,
    suffixIcon: Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child:
          isPasswordField
              ? Focus(
                canRequestFocus: false,
                descendantsAreFocusable: false,
                child: IconButton(
                  color: contentColor ?? Colors.grey.shade400,
                  icon:
                      showPassword
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                  onPressed: onPressed,
                ),
              )
              : const SizedBox(),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: borderRadius ?? BorderRadius.circular(8.0),
      borderSide: BorderSide(
        width: 0.5,
        color: borderColor ?? Colors.grey.shade300,
      ),
    ),
    // border: OutlineInputBorder(
    //   borderRadius:  borderRadius ?? BorderRadius.circular(8.0),
    //   borderSide: const BorderSide(width: 1),
    // ),
    focusedBorder: OutlineInputBorder(
      borderRadius: borderRadius ?? BorderRadius.circular(8.0),
      borderSide: BorderSide(color: Get.theme.primaryColor, width: 1),
    ),
  );
}
