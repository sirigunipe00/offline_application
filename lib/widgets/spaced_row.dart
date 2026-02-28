import 'package:flutter/material.dart';
import 'package:offline_first/widgets/app_spacer.dart';

class SpacedRow extends StatelessWidget {
  const SpacedRow({
    super.key,
    this.defaultHeight = 4.0,
    this.margin,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.min,
    this.divider,
    required this.children,
  });

  final double defaultHeight;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;
  final Widget? divider;
  final EdgeInsets? margin;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final dividerWidget = divider ?? AppSpacer(height: defaultHeight);

    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: Row(
        crossAxisAlignment: crossAxisAlignment,
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: mainAxisSize,
        children: children.expand((widget) => [widget, dividerWidget]).toList(),
      ),
    );
  }
}
