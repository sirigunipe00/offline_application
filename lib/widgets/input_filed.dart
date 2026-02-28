import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:offline_first/core/core.dart';
import 'package:offline_first/styles/app_color.dart';
import 'package:offline_first/widgets/caption_text.dart';
import 'package:offline_first/widgets/spaced_column.dart';

class InputField extends StatelessWidget {
  InputField({
    super.key,
    required this.title,
    this.initialValue,
    this.onChanged,
    this.onSubmitted,
    this.inputType = TextInputType.text,
    this.maxLength = 255,
    this.readOnly = false,
    this.hintText,
    this.suffixIcon,
    this.autofocus = false,
    this.borderColor,
    this.minLines,
    this.maxLines,
    this.inputFormatters,
    this.focusNode,
    this.color = AppColors.black,
    this.isRequired = false,
    TextEditingController? controller,
    this.validator,
  }) {
    this.controller = controller ?? TextEditingController();
    if (initialValue?.isNotEmpty == true) {
      this.controller?.text = initialValue!;
    }
  }

  final String title;
  final String? initialValue;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final TextInputType inputType;
  final int maxLength;
  final bool readOnly;
  final String? hintText;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final Color? borderColor;
  final String? Function(String?)? validator;
  late final TextEditingController? controller;
  final bool autofocus;
  final bool isRequired;
  final Color color;
  final int? minLines;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    final bool isReadOnlyMode = readOnly;

    final backgroundColor = isReadOnlyMode
        ? AppColors.grey.withValues(alpha: 0.20)
        : Colors.white;

    final effectiveBorderColor = isReadOnlyMode
        ? Colors.grey.withValues(alpha:0.3)
        : null;

    final effectiveTextStyle = TextStyle(
      color: isReadOnlyMode
          ? AppColors.black.withValues(alpha:.7) 
          : AppColors.black,
      fontSize: 14,
      fontWeight: isReadOnlyMode ? FontWeight.w500 : FontWeight.normal,
    );

    return Focus(
      focusNode: focusNode,
      child: SpacedColumn(
        crossAxisAlignment: CrossAxisAlignment.start,
        defaultHeight: 8.0,
        children: [
          CaptionText(title: title, isRequired: isRequired, color: color),
          Container(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: effectiveBorderColor ?? (borderColor ?? AppColors.grey.withValues(alpha:0.30)),
                width: 0,
              ),
            ),
            child: TextFormField(
              style: effectiveTextStyle,
              controller: controller,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                border: InputBorder.none,
                suffixIcon: isReadOnlyMode
                    ? Icon(Icons.lock, size: 18, color: Colors.grey.shade500)
                    : suffixIcon,
                counterText: '',
                hintText: hintText,
                hintStyle: context.textTheme.labelSmall?.copyWith(
                  color: AppColors.grey,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              obscuringCharacter: '*',
              textInputAction: TextInputAction.done,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              onChanged: onChanged,
              onFieldSubmitted: onSubmitted,
              validator: validator,
              keyboardType: inputType,
              inputFormatters: inputFormatters,
              maxLength: maxLength,
              textCapitalization: TextCapitalization.none,
              readOnly: isReadOnlyMode,
              enableInteractiveSelection: !isReadOnlyMode,
              minLines: minLines ?? 1,
              maxLines: maxLines ?? 1,
              autocorrect: false,
              autofocus: autofocus,
            ),
          ),
        ],
      ),
    );
  }
}
