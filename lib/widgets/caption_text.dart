import 'package:flutter/material.dart';

import 'package:offline_first/core/core.dart';
import 'package:offline_first/styles/app_color.dart';

class CaptionText extends StatelessWidget {
  const CaptionText({
    super.key,
    required this.title,
    this.isRequired = true,

    this.color = AppColors.black,
  });

  final String title;
  final bool isRequired;
  final Color color;

  @override
  Widget build(BuildContext context) {
    if (title.doesNotHaveValue) return const SizedBox.shrink();

    return RichText(
      text: TextSpan(
        style: context.textTheme.titleSmall?.copyWith(
          color: color,
          fontSize: 15,
          fontWeight: FontWeight.w700,

          fontFamily: 'Urbanist',
        ),
        children: [
          TextSpan(text: title),
          if (isRequired) ...[
            const TextSpan(text: ' *', style: TextStyle(color: AppColors.red)),
          ],
        ],
      ),
    );
  }
}
