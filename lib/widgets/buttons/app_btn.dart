import 'package:flutter/material.dart';
import 'package:offline_first/core/core.dart';
import 'package:offline_first/styles/app_color.dart';
import 'package:offline_first/styles/text_styles.dart';
import 'package:offline_first/widgets/loading_indicator.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.margin,
    required this.label,
    this.bgColor = AppColors.green,
    this.isLoading = false,
    this.onPressed,
    this.textStyle,
    this.loadingText,
    this.height,
    this.width,
    this.onReject,
    this.borderColor,
    
    this.icon = const SizedBox.shrink(),
  });

  final String label;
  final bool isLoading;
  final Color bgColor;
  final VoidCallback? onReject;
  final Widget icon;
  final EdgeInsets? margin;
  final String? loadingText;
  final VoidCallback? onPressed;
  final TextStyle? textStyle;
  final double? width;
  final Color? borderColor;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,

          disabledBackgroundColor: AppColors.chimneySweep,
          fixedSize: Size(width ?? 120, height ?? 46),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          

            side: BorderSide(
              color: borderColor ?? ( onPressed == null ? AppColors.chimneySweep : bgColor),
              width: 1.5,
            ),
          ),
          padding: const EdgeInsets.all(4.0),
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
                      textAlign: TextAlign.center,
                ),
      ),
    );
  }
}
