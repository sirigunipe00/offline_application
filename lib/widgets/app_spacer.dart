import 'package:flutter/material.dart';

class AppSpacer extends StatelessWidget {

  factory AppSpacer.empty() => const AppSpacer(height: 0, width: 0);
  factory AppSpacer.p4() => const AppSpacer(height: 4, width: 4);
  factory AppSpacer.p8() => const AppSpacer(height: 8, width: 8);
  factory AppSpacer.p12() => const AppSpacer(height: 12, width: 12);
  factory AppSpacer.p24() => const AppSpacer(height: 24, width: 24);
  factory AppSpacer.p32() => const AppSpacer(height: 32, width: 32);
  
  const AppSpacer({super.key, this.height, this.width});

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) => SizedBox(height: height, width: width);
}
