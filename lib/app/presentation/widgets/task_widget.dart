import 'package:flutter/material.dart';
import 'package:offline_first/styles/app_color.dart';

class TaskWidget extends StatelessWidget {

  const TaskWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.onCancel,
  });
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback? onCancel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16,bottom: 15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFF00CC88),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
              color: AppColors.litegreen,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: const Color(0xFF00CC88), size: 30),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: onCancel,
            child: const Icon(Icons.cancel, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
