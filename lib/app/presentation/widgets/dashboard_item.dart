import 'package:flutter/material.dart';
import 'package:offline_first/auth/model/logged_in_user.dart';
import 'package:offline_first/styles/app_icons.dart';

class DashboardItem {

  const DashboardItem({
    required this.title,
    required this.icon,
    required this.onTap,
    this.iconSize,
    required this.permissionSelector,
  });
  final String title;
  final AppIcon icon;
  final Size? iconSize;
  final void Function(BuildContext context) onTap;
  final int? Function(RoleStatus? roleStatus) permissionSelector;
}
