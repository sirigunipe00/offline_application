import 'package:flutter/material.dart';
import 'package:offline_first/core/core.dart';
import 'package:offline_first/styles/app_color.dart';

class SimpleAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SimpleAppBar({
    super.key,
    required this.title,
    this.isLoading = false,
    this.dropdown,
    this.onPressed,
    this.textStyle,
    required this.actionButton,
    this.onScan,
    this.showScanner = false,
  });

  final String title;
  final Widget? dropdown;
  final VoidCallback? onPressed;
  final bool isLoading;
  final TextStyle? textStyle;
  final Widget? actionButton;
  final VoidCallback? onScan;
  final bool showScanner;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 35.0, bottom: 0),
      child: Container(
      constraints: const BoxConstraints(minHeight: 80), 

        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: AppColors.darkBlue,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            bottomLeft: Radius.circular(25),
            topRight: Radius.circular(20.0),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title Row
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: IconButton(
                    padding: const EdgeInsets.only(left: 2),
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.liteyellow,
                    ),
                    onPressed: context.close,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Urbanist',
                    ),
                  ),
                ),
                if (actionButton != null) ...[
                  const SizedBox(height: 12),
                  actionButton!,
                ],
              ],
            ),
            // Dropdown Row with Scan Icon (conditionally)
            if (dropdown != null) ...[
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: dropdown!),
                  if (showScanner) ...[   // Only show scanner if true
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: onScan,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Container(
                            height: 55,
                            width: 50,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(Icons.qr_code_scanner,
                                color: AppColors.darkBlue),
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(250);
}

