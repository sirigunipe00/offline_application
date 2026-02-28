import 'package:flutter/material.dart';
import 'package:offline_first/widgets/dailogs/dialog_content.dart';
import 'package:offline_first/widgets/dailogs/success_content.dart';

enum DialogType { normal, error, confirmRetry }

class AppDialog {
  static Future<T?> show<T>(
    BuildContext context, {
    String? title,
    required String content,
    required VoidCallback onTapOkay,
    DialogType type = DialogType.normal,
    String buttonText = 'Okay',
    bool barrierDismissible = true,
  }) async =>
      await showGeneralDialog<T?>(
        context: context,
        barrierDismissible: barrierDismissible,
        barrierLabel: 'Dialog',
        useRootNavigator: true,
        pageBuilder: (_, __, ___) => DialogWidget(
          title: title,
          content: content,
          buttonText: buttonText,
          onTapDismiss: onTapOkay,
          dialogType: type,
        ),
      );

  static Future<T?> showErrorDialog<T>(
    BuildContext context, {
    String? title,
    required String content,
    required VoidCallback onTapDismiss,
    bool barrierDismissible = true,
    String buttonText = 'Cancel',
  }) async =>
      await showGeneralDialog<T?>(
        context: context,
        barrierLabel: 'ErrorDialog',
        useRootNavigator: true,
        barrierDismissible: barrierDismissible,
        pageBuilder: (_, __, ___) => ErrorContent(
          title: title,
          content: content,
          buttonText: buttonText,
          onTapDismiss: onTapDismiss,
          imagePath: 'assets/images/error.svg',
        ),
      );
    

  static Future<T?> showSuccessDialog<T>(
    BuildContext context, {
    String? title,
    required String content,
    required VoidCallback onTapDismiss,
    String buttonText = 'Thank you',
   
  }) async =>
      await showGeneralDialog<T>(
        context: context,
        barrierLabel: 'SuccessDialog',
        useRootNavigator: true,
        barrierDismissible: false,
        pageBuilder: (_, __, ___) => SuccessContent(
          title: title,
          imagePath: 'assets/images/succes.svg',
          content: content,
          buttonText: buttonText,
          onTapDismiss: 
            onTapDismiss
        ),
      );

  static Future<T?> askForConfirmation<T>(
    BuildContext context, {
    String? title,
    required String content,
    required VoidCallback onTapDismiss,
    String buttonText = 'Cancel',
    bool barrierDismissible = true,
    String confirmBtnText = 'Okay',
    required VoidCallback onTapConfirm,
  }) async =>
      await showGeneralDialog<T>(
        context: context,
        useRootNavigator: false,
        barrierDismissible: barrierDismissible,
        barrierLabel: 'ConfirmationDialog',
        pageBuilder: (_, __, ___) => DialogWidget(
          title: title,
          content: content,
          buttonText: buttonText,
          onTapDismiss: onTapDismiss,
          dialogType: DialogType.confirmRetry,
          confirmBtnText: confirmBtnText,
          onTapConfirm: onTapConfirm,
        ),
      );
     

}