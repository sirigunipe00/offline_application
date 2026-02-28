import 'package:flutter/material.dart';
import 'package:offline_first/styles/app_color.dart';
import 'package:offline_first/widgets/app_spacer.dart';

class AppFeatureWidget extends StatelessWidget {
  const AppFeatureWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.featureColor,
  });

  final Widget icon;
  final Widget title;
  final VoidCallback onTap;
  final Color? featureColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: featureColor ?? Colors.white, // Background color
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: featureColor ?? AppColors.black,
              width: 1,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppSpacer.p12(),
              Flexible(
                child: Center(child: icon),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.all(4),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(child: title),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
