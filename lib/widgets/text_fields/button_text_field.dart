import 'package:flutter/material.dart';

import '../../utils/enums.dart';
import '../buttons/text_field_elevated_button.dart';
import 'layout_text_field.dart';

class ButtonTextField extends StatefulWidget {
  const ButtonTextField({
    super.key,
    required this.hintText,
    required this.textValidationType,
    required this.onFieldSubmitted,
    required this.buttonIcon,
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
    this.textFieldPrefix,
    this.textFieldSuffix,
    this.widthPadding = 0,
    this.borderRadius,
  });

  final String hintText;
  final TextValidationType textValidationType;
  final void Function(String)? onFieldSubmitted;
  final IconData? prefixIcon;
  final void Function(String)? onChanged;
  final Color? contentColor;
  final Color? borderColor;
  final int? minLines;
  final int? maxLines;
  final TextInputType? textInputType;
  final TextEditingController? previousPasswordController;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final Widget? suffix;
  final Widget? prefix;
  final Widget? textFieldPrefix;
  final Widget? textFieldSuffix;
  final Icon buttonIcon;
  final double widthPadding;
  final BorderRadius? borderRadius;

  @override
  State<ButtonTextField> createState() =>
      _ButtonTextFieldState();
}

class _ButtonTextFieldState extends State<ButtonTextField> {
  final TextEditingController inputController =
      TextEditingController();

  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>();

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }

  Future<void> search() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (widget.onFieldSubmitted != null) {
      widget.onFieldSubmitted!(inputController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutTextField(
      formKey: _formKey,
      controller: inputController,
      previousPasswordController:
          widget.previousPasswordController,
      labelText: widget.hintText,
      textValidationType: widget.textValidationType,
      onFieldSubmitted: widget.onFieldSubmitted,
      onChanged: widget.onChanged,
      contentColor: widget.contentColor,
      borderColor: widget.borderColor,
      minLines: widget.minLines,
      nextFocus: widget.nextFocus,
      focusNode: widget.focusNode,
      maxLines: widget.maxLines,
      textInputType: widget.textInputType,
      suffix: widget.suffix,
      prefix: widget.prefix,
      prefixIcon: widget.prefixIcon,
      textFieldPrefix: widget.textFieldPrefix,
      widthPadding: widget.widthPadding,
      borderRadius:
          widget.borderRadius ??
          const BorderRadius.only(
            bottomLeft: Radius.circular(16.0),
            topLeft: Radius.circular(16.0),
          ),
      textFieldSuffix:
          widget.textFieldSuffix ??
          EndOfTextFieldElevatedButton(
            height: 49.0,
            onTap: () async => widget.onFieldSubmitted,
            child: widget.buttonIcon,
          ),
    );
  }
}
