import 'package:flutter/material.dart';

import '../../../core/constants/lucy_constants.dart';
import 'lucy_text_field.dart';

/// Mobile auth text field with slightly tighter padding.
class LucyTextFieldMobile extends LucyTextField {
  const LucyTextFieldMobile({
    super.key,
    required super.label,
    super.hintText,
    super.initialValue,
    super.onChanged,
    super.validator,
    super.keyboardType,
    super.textInputAction,
    super.isPassword,
    super.isEnabled,
    super.formFieldKey,
  }) : super(
         contentPadding: const EdgeInsets.symmetric(
           horizontal: LucyConstants.kSpacingMedium,
           vertical: LucyConstants.kSpacingLow,
         ),
       );
}
