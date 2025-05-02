import "package:burakbasci_widgets/utils/enums.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

String? textFieldValidation({
  String? enteredText,
  required TextValidationType textValidationType,
  required TextEditingController textInputController,
  TextEditingController? previousPasswordController,
}) {
  if (kDebugMode) {
    print('Validating enteredText: $enteredText');
  }

  if ((textValidationType ==
              TextValidationType.optinalUrl ||
          textValidationType ==
              TextValidationType.optinalPhoneNumber ||
          textValidationType ==
              TextValidationType.optionalInteger ||
          textValidationType ==
              TextValidationType.optinalUrl) &&
      (enteredText == null || enteredText.isEmpty)) {
    return null;
  }

  if (enteredText == null || enteredText.isEmpty) {
    return 'Please enter something!'.tr;
  }

  switch (textValidationType) {
    /// Username validity check
    case TextValidationType.username:
      if (!GetUtils.isUsername(enteredText)) {
        return 'Username can only contain letters, numbers, "_" amd".". They also must start and end with a letter'
            .tr;
      } else if (!GetUtils.isLengthGreaterThan(
        enteredText,
        4,
      )) {
        return 'Please enter at least 5 Characters!'.tr;
      } else if (!GetUtils.isLengthLessThan(
        enteredText,
        25,
      )) {
        return 'Please enter less than 25 Characters'.tr;
      } else {
        return null;
      }

    /// Name validity check
    case TextValidationType.name:
      if (!GetUtils.isLengthGreaterThan(enteredText, 2)) {
        return 'Please enter at least 3 Characters!'.tr;
      } else if (!GetUtils.isLengthLessThan(
        enteredText,
        65,
      )) {
        return 'Please enter less than 65 Characters'.tr;
      } else {
        return null;
      }

    /// Title validity check
    case TextValidationType.title:
      if (!GetUtils.isLengthGreaterThan(enteredText, 6)) {
        return 'Please enter at least 7 Characters!'.tr;
      } else if (!GetUtils.isLengthLessThan(
        enteredText,
        129,
      )) {
        return 'Please enter less than 129 Characters'.tr;
      } else {
        return null;
      }

    /// e-Mail validity check
    case TextValidationType.eMail:
      if (!GetUtils.isEmail(enteredText)) {
        return 'Please a valid e-Mail!'.tr;
      } else if (!GetUtils.isLengthLessThan(
        enteredText,
        255,
      )) {
        return 'Your e-Mail is way too long mate!'.tr;
      } else {
        return null;
      }

    /// Password validity check
    case TextValidationType.password:
      if (!GetUtils.isLengthGreaterThan(enteredText, 6)) {
        return 'Please enter at least 7 Characters!'.tr;
      } else if (!GetUtils.isLengthLessThan(
        enteredText,
        40,
      )) {
        return 'Please enter less than 40 Characters!'.tr;
      } else {
        return null;
      }

    /// Repeat Password validity check
    case TextValidationType.repeatPassword:
      if (textInputController.text !=
          previousPasswordController!.text) {
        return 'Passwords do not match!'.tr;
      } else {
        return null;
      }

    /// URL validity check
    case TextValidationType.url:
    case TextValidationType.optinalUrl:
      if (!GetUtils.isURL(enteredText)) {
        return 'Please enter a valid URL!'.tr;
      } else {
        return null;
      }

    /// Phone Number validity check
    case TextValidationType.phoneNumber:
    case TextValidationType.optinalPhoneNumber:
      if (!GetUtils.isPhoneNumber(enteredText)) {
        return 'Please enter a valid Phone Number!'.tr;
      } else {
        return null;
      }

    /// Text validity check
    case TextValidationType.shortText:
      if (!GetUtils.isLengthLessThan(enteredText, 280)) {
        return 'Your Text is too long!'.tr;
      } else {
        return null;
      }

    /// Text validity check
    case TextValidationType.longText:
      if (!GetUtils.isLengthLessThan(enteredText, 3000)) {
        return 'Your Text is too long!'.tr;
      } else {
        return null;
      }

    /// Integer validity check
    case TextValidationType.integer:
    case TextValidationType.optionalInteger:
      if (!GetUtils.isNumericOnly(enteredText)) {
        return 'Please enter whole numbers only!'.tr;
      } else {
        return null;
      }

    case TextValidationType.noValidation:
      return null;
  }
}
