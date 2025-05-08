import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '/utils/enums.dart';
import 'general_text_feld_validation.dart';
import 'general_text_field_style.dart';

class GeneralTextField extends StatefulWidget {
  const GeneralTextField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.textValidationType,
    required this.onFieldSubmitted,
    this.onChanged,
    this.contentColor,
    this.borderColor,
    this.prefixIcon,
    this.minLines,
    this.maxLines = 1,
    this.textInputType,
    this.previousPasswordController,
    this.focusNode,
    this.nextFocus,
    this.suffix,
    this.prefix,
    this.borderRadius,
  });

  final TextEditingController controller;
  final String labelText;
  final TextValidationType textValidationType;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final Color? contentColor;
  final Color? borderColor;
  final IconData? prefixIcon;
  final int? minLines;
  final int? maxLines;
  final TextInputType? textInputType;
  final TextEditingController? previousPasswordController;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final Widget? suffix;
  final Widget? prefix;
  final BorderRadius? borderRadius;

  @override
  State<GeneralTextField> createState() =>
      _GeneralTextFieldState();
}

class _GeneralTextFieldState
    extends State<GeneralTextField> {
  static bool showPassword = true;

  bool isPasswordField() {
    if (widget.textValidationType ==
            TextValidationType.password ||
        widget.textValidationType ==
            TextValidationType.repeatPassword) {
      return true;
    } else {
      return false;
    }
  }

  bool _isObscureText() {
    if (isPasswordField()) {
      return showPassword;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      /// Output the value of the text field to the controller
      onChanged: widget.onChanged,
      onEditingComplete: () {
        if (widget.nextFocus != null) {
          if (kDebugMode) {
            print('next focus');
          }
          // if (widget.focusNode != null)
          // widget.focusNode!.unfocus();
          FocusScope.of(
            context,
          ).requestFocus(widget.nextFocus);
          // Get.focusScope?.nextFocus();
        }
      },
      onFieldSubmitted: widget.onFieldSubmitted,

      ///
      controller: widget.controller,
      keyboardType: widget.textInputType,
      focusNode: widget.focusNode,
      minLines: widget.minLines,
      maxLines: widget.maxLines,
      obscureText: _isObscureText(),
      cursorColor: Get.theme.colorScheme.secondary,

      /// Decoration of the text field
      decoration: textfieldStyle(
        prefixIcon: widget.prefixIcon,
        labelText: widget.labelText,
        contentColor: widget.contentColor,
        borderColor: widget.borderColor,
        borderRadius: widget.borderRadius,
        isPasswordField: isPasswordField(),
        showPassword: showPassword,
        suffix: widget.suffix,
        prefix: widget.prefix,
        onPressed: () {
          setState(() {
            showPassword = !showPassword;
          });
        },
      ),

      /// Input format of the text field
      inputFormatters:
          widget.textValidationType ==
                  TextValidationType.integer
              ? <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ]
              : null,

      /// Validation of the text field
      validator: (enteredText) {
        return textFieldValidation(
          enteredText: enteredText,
          textValidationType: widget.textValidationType,
          textInputController: widget.controller,
          previousPasswordController:
              widget.previousPasswordController,
        );
      },
    );
  }
}
