import 'package:flutter/material.dart';

import '../../utils/enums.dart';
import 'sub_widgets/general_text_field.dart';

class LayoutTextField extends StatefulWidget {
  const LayoutTextField({
    super.key,
    required this.formKey,
    required this.controller,
    required this.labelText,
    required this.textValidationType,
    required this.onFieldSubmitted,
    this.onChanged,
    this.contentColor,
    this.borderColor,
    this.minLines,
    this.prefixIcon,
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

  final GlobalKey<FormState> formKey;
  final TextEditingController controller;
  final String labelText;
  final TextValidationType textValidationType;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final Color? contentColor;
  final Color? borderColor;
  final int? minLines;
  final IconData? prefixIcon;
  final int? maxLines;
  final TextInputType? textInputType;
  final TextEditingController? previousPasswordController;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final Widget? suffix;
  final Widget? prefix;
  final Widget? textFieldPrefix;
  final Widget? textFieldSuffix;
  final double widthPadding;
  final BorderRadius? borderRadius;

  @override
  State<LayoutTextField> createState() =>
      _LayoutTextFieldState();
}

class _LayoutTextFieldState extends State<LayoutTextField> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (
        BuildContext context,
        BoxConstraints constraints,
      ) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            if (widget.textFieldPrefix != null)
              widget.textFieldPrefix!,
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth:
                    (widget.textFieldSuffix != null)
                        ? constraints.maxWidth -
                            widget.widthPadding -
                            72.0
                        : constraints.maxWidth -
                            widget.widthPadding,
              ),
              child: Form(
                key: widget.formKey,
                child: GeneralTextField(
                  controller: widget.controller,
                  previousPasswordController:
                      widget.previousPasswordController,
                  prefix: widget.prefix,
                  suffix: widget.suffix,
                  contentColor: widget.contentColor,
                  borderColor: widget.borderColor,
                  minLines: widget.minLines,
                  textInputType: widget.textInputType,
                  maxLines: widget.maxLines,
                  focusNode: widget.focusNode,
                  nextFocus: widget.nextFocus,
                  onFieldSubmitted: widget.onFieldSubmitted,
                  onChanged: widget.onChanged,
                  prefixIcon: widget.prefixIcon,
                  labelText: widget.labelText,
                  textValidationType:
                      widget.textValidationType,
                  borderRadius: widget.borderRadius,
                ),
              ),
            ),
            if (widget.textFieldSuffix != null)
              widget.textFieldSuffix!,
          ],
        );
      },
    );
  }
}
