
import 'package:flutter/material.dart';
import 'package:offline_first/core/core.dart';
import 'package:offline_first/styles/app_color.dart';


abstract class AppTextStyles {
  static TextStyle featureLabelStyle(BuildContext context) => titleLarge(context).copyWith(
    fontSize: 20,
    fontFamily: 'Urbanist',
    color: AppColors.black,
  );

  static TextStyle textEntryStyle(BuildContext context) => context.textTheme.titleMedium!.copyWith(
    fontWeight: FontWeight.bold,
    color: AppColors.black,
    fontFamily: 'Urbanist',
    fontSize: 15
  );

  static TextStyle titleLarge(BuildContext context) => context.textTheme.titleMedium!.copyWith(
    fontWeight: FontWeight.bold,
    fontFamily: 'Urbanist',
    color: AppColors.white,
  );

  static TextStyle labelLarge(BuildContext context) => context.textTheme.labelLarge!.copyWith(
    fontWeight: FontWeight.bold,
    fontFamily: 'Urbanist',
    color: AppColors.white,
  );

  static TextStyle titleMedium(BuildContext context, Color color) => context.textTheme.titleSmall!.copyWith(
    fontWeight: FontWeight.bold,
    fontFamily: 'Urbanist',
    color: color,
  );

  static TextStyle titleMediumBlack(BuildContext context) => titleMedium(context,Colors.white);
  static TextStyle titleMediumWhite(BuildContext context) => titleMedium(context, AppColors.white);

  static TextStyle errorStyle(BuildContext context) => context.textTheme.labelMedium!.copyWith(
    fontWeight: FontWeight.bold,
    fontFamily: 'Urbanist',
    color: AppColors.red,
  );

  static TextStyle btnLabelStyle(BuildContext context) => context.textTheme.titleLarge!.copyWith(
      color: AppColors.white, 
      fontFamily: 'Urbanist',
      fontWeight: FontWeight.bold,
    );
}