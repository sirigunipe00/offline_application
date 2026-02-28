import 'package:flutter/material.dart';
import 'package:offline_first/styles/app_color.dart';
import 'package:offline_first/styles/app_text_styles.dart';

class DocStatusWidget extends StatelessWidget {
  const DocStatusWidget({super.key, required this.status});

  final String status;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50, 
      height: 20, 
      alignment: Alignment.center, 
      decoration: BoxDecoration(
        color: toColor(),
        border: Border.all(color: toColor()),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        status,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: AppTextStyles.labelLarge(context).copyWith(
          color: toTextColor(),
          fontSize: 10,
          fontFamily: 'Urbanist',
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Color toColor() => switch (status.trim()) {
    'Submitted' => const Color(0xFFEAFFF6),
    'Draft' => const Color(0xFFE3F2FE),
    'Rejected' => const Color(0xFFC16D67),
    'Reported' => const Color(0xFFEAFFF6),
    String() => const Color.fromARGB(255, 254, 254, 254),
  };

  Color toTextColor() => switch (status.trim()) {
    'Submitted' => const Color(0xFF35C285),
    'Draft' => const Color(0xFF0087FF),
    'Rejected' => const Color(0xFFFFE2DA),
    'Reported' => const Color(0xFF0087FF),

    String() => AppColors.black,
  }; 
}
