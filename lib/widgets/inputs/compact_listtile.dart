import 'package:offline_first/core/core.dart';
import 'package:flutter/material.dart';
import 'package:offline_first/styles/app_color.dart';


class CompactCheckBoxTile extends StatelessWidget {
  const CompactCheckBoxTile({
    super.key,
    required this.title,
    required this.value,
    this.onTap,
  });

  final String title;
  final bool value;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      enabled: true,
      selected: value,
      checkColor: AppColors.grey,
      activeColor: AppColors.grey,
      fillColor: const WidgetStatePropertyAll(AppColors.white),
      onChanged: null,
      value: value,
      contentPadding: EdgeInsets.zero,
      dense: true,
      visualDensity: const VisualDensity(vertical: -3),
      title: Text(title),
    );
  }
}


class CompactListTile extends StatelessWidget {
  const CompactListTile({
    super.key,
    required this.title,
    this.subtitle,
    this.onTap,
    this.leading,
  });

  final String title;
  final String? subtitle;
  final VoidCallback? onTap;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      tileColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
      dense: true,
      leading: leading,
      visualDensity: const VisualDensity(vertical: -3),
      title: Text(title),
      subtitle: subtitle.isNotNull ? Text(subtitle.valueOrEmpty) : null,
    );
  }
}

class SelectedItemBuilder extends StatelessWidget {
  const SelectedItemBuilder(this.value, {super.key});

  final String value;

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: const TextStyle(fontSize: 16, color: AppColors.black),
      overflow: TextOverflow.ellipsis,
    );
  }
}
