import 'package:flutter/material.dart';
import 'package:offline_first/core/core.dart';
import 'package:offline_first/styles/app_color.dart';
import 'package:offline_first/styles/text_styles.dart';
import 'package:offline_first/widgets/loading_indicator.dart';

class SubmitBtn extends StatelessWidget {
  const SubmitBtn({
    super.key,
    this.margin,
    required this.label,
    this.bgColor = const Color.fromARGB(255, 184, 40, 100),
    this.isLoading = false,
    this.onPressed,
    this.textStyle,
    this.loadingText,
    this.icon = const SizedBox.shrink(),
  });

  final String label;
  final bool isLoading;
  final Color bgColor;
  final Widget icon;
  final EdgeInsets? margin;
  final String? loadingText;
  final VoidCallback? onPressed;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          disabledBackgroundColor: AppColors.chimneySweep,
          fixedSize: const Size(100, 36), 
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(
              color: onPressed == null ? AppColors.chimneySweep : bgColor,
            ),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 8.0,
          ),
        ),
      
        onPressed: isLoading ? null : onPressed,
        icon: icon,
        label:
            (isLoading && loadingText.doesNotHaveValue)
                ? const LoadingIndicator(color: AppColors.white)
                : Text(
                  isLoading ? loadingText.valueOrEmpty : label,
                  style: (textStyle ?? TextStyles.btnTextStyle(context))
                      .copyWith(
                        color: onPressed.isNull ? AppColors.grey : null,
                      ),
                ),
      ),
    );
  }
}
