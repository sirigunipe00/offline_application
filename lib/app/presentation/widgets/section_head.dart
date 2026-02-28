import 'package:flutter/material.dart';
import 'package:offline_first/widgets/app_spacer.dart';

class SectoinHead extends StatelessWidget {
  const SectoinHead({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppSpacer.p4(),
        Text(title, style: const TextStyle(fontSize: 15,
          fontWeight: FontWeight.bold,
        ),),
        AppSpacer.p8(),
      ],
    );
  }
}