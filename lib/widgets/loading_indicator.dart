import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key, this.color = const Color(0xff4c5c92)});

  final Color color;
  @override
  Widget build(BuildContext context) => Center(
    child: CircularProgressIndicator(
      backgroundColor: Colors.black12,
      color: color,
      strokeWidth: 4,
    ),
  );
}