import 'package:flutter/material.dart';

import '../../../core/constants/lucy_constants.dart';
import '../../../core/extensions/context.dart';

/// Shared text field for auth forms (web and mobile variants).
class LucyTextField extends StatefulWidget {
  const LucyTextField({
    super.key,
    required this.label,
    this.hintText,
    this.initialValue,
    this.onChanged,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.isPassword = false,
    this.isEnabled = true,
    this.formFieldKey,
    this.contentPadding,
  });

  final String label;
  final String? hintText;
  final String? initialValue;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final bool isPassword;
  final bool isEnabled;
  final GlobalKey<FormFieldState<String>>? formFieldKey;
  final EdgeInsetsGeometry? contentPadding;

  @override
  State<LucyTextField> createState() => _LucyTextFieldState();
}

class _LucyTextFieldState extends State<LucyTextField> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;
  bool _obscure = true;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue ?? '');
    _focusNode = FocusNode()..addListener(_onFocusChange);
    _obscure = widget.isPassword;
  }

  void _onFocusChange() {
    if (!_focusNode.hasFocus) {
      widget.formFieldKey?.currentState?.validate();
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;

    return TextFormField(
      key: widget.formFieldKey,
      controller: _controller,
      focusNode: _focusNode,
      enabled: widget.isEnabled,
      obscureText: widget.isPassword && _obscure,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      onChanged: widget.onChanged,
      validator: widget.validator,
      style: context.textTheme.bodyLarge?.copyWith(color: scheme.onSurface),
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hintText,
        contentPadding: widget.contentPadding ??
            const EdgeInsets.symmetric(
              horizontal: LucyConstants.kSpacingMedium,
              vertical: LucyConstants.kSpacingMedium,
            ),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscure ? Icons.visibility_off : Icons.visibility,
                  color: scheme.tertiary,
                ),
                onPressed: () => setState(() => _obscure = !_obscure),
              )
            : null,
      ),
    );
  }
}
