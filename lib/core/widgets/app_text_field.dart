import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:attendance/core/themes/styles/app_text_style.dart';

class AppTextFieldWithTitle extends StatelessWidget {
  const AppTextFieldWithTitle({
    super.key,
    required this.title,
    required this.hint,
    this.scure = false,
    this.enabeld = true,
    this.onChanged,
    this.readOnly = false,
    this.controller,
    this.validator,
    this.autofillHints,
    this.inputFormatters,
    this.keyboardType,
    this.maxLines = 1,
    this.fillColor,
    this.prefixIcon,
    this.suffixIcon,
  });
  final String title, hint;
  final bool scure, enabeld, readOnly;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Iterable<String>? autofillHints;
  final List<TextInputFormatter>? inputFormatters;
  final Color? fillColor;
  final TextInputType? keyboardType;
  final int maxLines;
  final Widget? prefixIcon, suffixIcon;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(title, style: AppTextStyles.lablell(context)),
            Text(
              "*",
              style: AppTextStyles.lablell(
                context,
              ).copyWith(color: Theme.of(context).primaryColor),
            ),
          ],
        ),
        const SizedBox(height: 5),
        AppTextField(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hint: hint,
          scure: scure,
          enabeld: enabeld,
          readOnly: readOnly,
          controller: controller,
          validator: validator,
          autofillHints: autofillHints,
          inputFormatters: inputFormatters,
          keyboardType: keyboardType,
          maxLines: maxLines,
          onChanged: onChanged,
        ),
      ],
    );
  }
}

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.hint,
    this.scure = false,
    this.enabeld = true,
    this.readOnly = false,
    this.controller,
    this.validator,
    this.autofillHints,
    this.inputFormatters,
    this.keyboardType,
    this.maxLines = 1,
    this.fillColor,
    this.prefixIcon,
    this.suffixIcon,
    this.withBorder = true,
    this.onTap,
    this.onChanged,
  });
  final String hint;
  final bool scure, enabeld, readOnly, withBorder;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Iterable<String>? autofillHints;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final int maxLines;
  final Color? fillColor;
  final Widget? prefixIcon, suffixIcon;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: scure,
      readOnly: readOnly,
      onTap: onTap,
      onChanged: onChanged,
      enabled: enabeld,
      validator: validator,
      autocorrect: false,
      autofillHints: autofillHints,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      maxLines: maxLines,
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      style: AppTextStyles.lablell(context),
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
