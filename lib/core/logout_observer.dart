import 'package:flutter/material.dart';

class AutoLogoutObserver extends WidgetsBindingObserver {
  AutoLogoutObserver({required this.onLogout});
  final VoidCallback onLogout;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      final now = DateTime.now();
      if (now.hour > 20 || (now.hour == 20)) {
        onLogout();
      }
    }
  }
}
