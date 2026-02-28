
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offline_first/auth/model/logged_in_user.dart';
import 'package:offline_first/core/di/injector.dart';

import 'package:offline_first/widgets/dailogs/app_snack_bar_widget.dart';


extension BuildContextExt on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  double get sizeOfWidth => MediaQuery.sizeOf(this).width;
  double get sizeOfHeight => MediaQuery.sizeOf(this).height;

  Future<T?> goToPage<T>(Widget child) => Navigator.of(this).push<T?>(
    MaterialPageRoute(builder: (ctx) => child),
  );
  
  void close<T>([T? data]) => Navigator.of(this).pop(data);
  void exit<T>([T? data]) => Navigator.of(this, rootNavigator: true).pop(data);

  T cubit<T extends Cubit<Object>>() => BlocProvider.of<T>(this);

  LoggedInUser get user => $sl.get<LoggedInUser>();

  void showSnackbar(String content, AppSnackBarType type) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: AppSnackBarWidget(content: content, type: type)),
    );
  }

 
}
