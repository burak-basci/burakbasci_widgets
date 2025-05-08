import 'package:flutter/material.dart';

import '../../utils/enums.dart';
import '../buttons/text_field_elevated_button.dart';
import 'layout_text_field.dart';

class BasicSearchBar extends StatefulWidget {
  const BasicSearchBar({
    super.key,
    this.onFieldSubmitted,
    this.onTap,
    this.onChanged,
    this.suffix,
    this.contentColor,
    this.borderColor,
    this.minLines,
    this.focusNode,
    this.nextFocus,
    this.labelText,
    this.widthpadding = 160.0,
  });

  final Future<void> Function(String)? onFieldSubmitted;
  final Future<void> Function()? onTap;
  final void Function(String)? onChanged;
  final Widget? suffix;
  final Color? contentColor;
  final Color? borderColor;
  final int? minLines;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final String? labelText;
  final double widthpadding;

  @override
  State<BasicSearchBar> createState() =>
      _BasicSearchBarState();
}

class _BasicSearchBarState extends State<BasicSearchBar> {
  final TextEditingController searchInputController =
      TextEditingController();

  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>();

  @override
  void dispose() {
    searchInputController.dispose();
    super.dispose();
  }

  Future<void> search() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (widget.onFieldSubmitted != null) {
      widget.onFieldSubmitted!(searchInputController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutTextField(
      formKey: _formKey,
      controller: searchInputController,
      labelText: widget.labelText ?? 'Search',
      textValidationType: TextValidationType.shortText,
      textInputType: TextInputType.text,
      onFieldSubmitted: widget.onFieldSubmitted,
      onChanged: widget.onChanged,
      nextFocus: widget.nextFocus,
      focusNode: widget.focusNode,
      contentColor: widget.contentColor,
      borderColor: widget.borderColor,
      minLines: widget.minLines,
      maxLines: 1,
      suffix: widget.suffix,
      prefix: null,
      prefixIcon: Icons.search,
      widthPadding: widget.widthpadding,
      borderRadius: BorderRadius.circular(0.0),
      textFieldSuffix: EndOfTextFieldElevatedButton(
        height: 49.0,
        onTap: () async {
          if (widget.onFieldSubmitted != null) {
            widget.onFieldSubmitted!(
              searchInputController.text,
            );
          }
        },
      ),
    );
  }
}
