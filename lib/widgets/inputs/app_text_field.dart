import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:offline_first/core/core.dart';
import 'package:offline_first/widgets/caption_text.dart';
import 'package:offline_first/widgets/spaced_column.dart';

class AppTextField extends StatelessWidget {
  AppTextField({
    super.key,
    this.title,
    this.labelText,
    this.initialValue,
    this.onChanged,
    this.onFieldSubmitted,
    this.inputType = TextInputType.text,
    this.minLines = 1,
    this.maxLines = 1,
    this.maxLength = 255,
    this.readOnly = false,
    this.helperText,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.suffix,

    this.autofocus = false,
    this.obscureText = false,
    this.textCapitalization = TextCapitalization.none,
    this.inputFormatters,
    this.isRequired = false,
    this.contentPadding = const EdgeInsets.all(12.0),
    this.validator,
    this.textInputAction = TextInputAction.done,
    TextEditingController? controller,
    Null Function()? onPressed,
  }) : controller = controller ?? TextEditingController(),
       super() {
    if (initialValue?.isNotEmpty == true) {
      this.controller.text = initialValue!;
    }
  }

  final String? title;
  final String? labelText;
  final String? initialValue;
  final Function(String text)? onChanged;
  final Function(String text)? onFieldSubmitted;
  final TextInputType inputType;
  final int minLines;
  final int maxLines;

  final int maxLength;
  final bool readOnly;
  final String? helperText;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffix;
  final Widget? suffixIcon;
  final TextCapitalization textCapitalization;
  final TextEditingController controller;
  final bool autofocus;
  final bool obscureText;
  final bool isRequired;
  final EdgeInsets contentPadding;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final TextInputAction textInputAction;

  @override
  Widget build(BuildContext context) {
    const borderRadius = BorderRadius.all(Radius.circular(12));

    return SpacedColumn(
      crossAxisAlignment: CrossAxisAlignment.start,
      defaultHeight: 4.0,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (title.containsValidValue)
          CaptionText(title: title.valueOrEmpty, isRequired: isRequired),
        TextFormField(
          controller: controller,
          obscureText: obscureText,

          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 15.0,
              horizontal: 10.0,
            ),
            labelText: labelText,
            labelStyle: context.textTheme.labelLarge?.copyWith(
              fontSize: 30,
              fontWeight: FontWeight.w500,
              color: const Color(0x0fff78f9),
            ),

            hintText: hintText ?? title?.replaceAll(':', ''),
            hintStyle: context.textTheme.labelSmall?.copyWith(
              color: const Color(0xFF8391A1),
              fontSize: 15,
              fontWeight: FontWeight.w500,
              fontFamily: 'Urbanist',
            ),
            filled: true,
            fillColor: const Color(0xFFF7F8F9),

            prefixIcon: prefixIcon,
            suffix: suffix,
            suffixIcon: suffixIcon,
            helperText: helperText,
            counterText: '',
            border: const OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: BorderSide(color: Color(0xFFE8ECF4),width: 1),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: BorderSide(color: Color(0xFF35C2C1), width: 1),
            ),
          ),
          validator: validator,
          onFieldSubmitted: onFieldSubmitted,
          onTapOutside:
              (event) => FocusManager.instance.primaryFocus?.unfocus(),
          obscuringCharacter: '*',
          inputFormatters: inputFormatters,
          keyboardType: inputType,
          minLines: minLines,
          maxLines: maxLines,
          maxLength: maxLength,
          textCapitalization: textCapitalization,
          readOnly: readOnly,
          autocorrect: false,
          autofocus: autofocus,
          onChanged: onChanged,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          textInputAction: textInputAction,
        ),
      ],
    );
  }
}
