import 'package:flutter/material.dart';

import 'package:offline_first/core/core.dart';
import 'package:offline_first/styles/app_color.dart';

class GoBackIconBtn extends StatelessWidget {
  const GoBackIconBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: InkWell(
        onTap: context.close,
        child: const CircleAvatar(
          backgroundColor: AppColors.white,
          radius: 16,
          child: Icon(Icons.arrow_back, color: AppColors.liteyellow, size: 20),
        ),
      ),
    );
  }
}
