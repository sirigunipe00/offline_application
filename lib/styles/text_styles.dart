import 'package:flutter/material.dart';

import 'package:offline_first/core/core.dart';
import 'package:offline_first/styles/app_color.dart';

abstract class TextStyles {
  static TextStyle appbarTextstyle(BuildContext context) => context.textTheme.titleMedium!.copyWith(
    color: AppColors.white,
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );
  
  static TextStyle? labelMedium(BuildContext context) => context.textTheme.labelMedium?.copyWith(
    color: AppColors.black,
  );

  static TextStyle? labelLarge(BuildContext context) => context.textTheme.labelLarge?.copyWith(
    color: AppColors.black,
    fontWeight: FontWeight.bold,
  );

  static TextStyle captionBold(BuildContext context) => context.textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold);

  static TextStyle titleBold(BuildContext context, {double? size}) => context.textTheme.titleMedium!.copyWith(
    fontWeight: FontWeight.bold,
    color: AppColors.green,
    fontSize: size,
  );

  static TextStyle titleSmall(BuildContext context, {double? size}) => context.textTheme.titleSmall!.copyWith(
    fontWeight: FontWeight.bold,
    color: AppColors.black,
    fontSize: size,
  );

  static TextStyle k12Bold(BuildContext context) => const TextStyle(
      fontSize: 12,
      color: AppColors.green,
      fontWeight: FontWeight.bold,
    );

  static TextStyle k14Bold(BuildContext context) => const TextStyle(
      fontSize: 16,
      color: AppColors.black,
      fontWeight: FontWeight.bold,
    );
  
  static TextStyle k10(BuildContext context) =>
      const TextStyle(fontSize: 12, color: AppColors.black, fontWeight: FontWeight.bold);
  
  static TextStyle btnTextStyle(BuildContext context) => context.textTheme.titleMedium!.copyWith(
    fontWeight: FontWeight.bold,
    color: AppColors.white,
    fontSize: 20,
  );
}
