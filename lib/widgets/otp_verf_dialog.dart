
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:offline_first/app/model/otp_request_type.dart';
// import 'package:offline_first/core/core.dart';
// import 'package:offline_first/styles/app_color.dart';
// import 'package:offline_first/widgets/otp_verification_widget.dart';

// abstract class OTPVerfDialog {
//   static Future<bool> launchOTPVerfDialog(
//     BuildContext context, {
//     required String mobileNumber,
//     required OTPRequestType type,
//     VoidCallback? onPop,
//   }) async {
//     return await showDialog<bool?>(
//       context: context,
//       barrierDismissible: false,
//       builder: (_) => AlertDialog(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12.0),
//         ),
//         insetPadding: const EdgeInsets.all(12.0),
//         contentPadding: const EdgeInsets.all(12.0),
//         backgroundColor: AppColors.white,
//         surfaceTintColor: AppColors.white,
//         actionsPadding: EdgeInsets.zero,
//         title: Row(
//           children: [
//             Expanded(
//               child: Text.rich(
//                 style: context.textTheme.titleLarge,
//                 textAlign: TextAlign.center,
//                 TextSpan(
//                   children: [
//                     const TextSpan(text:  'An OTP has been sent to '),
//                     TextSpan(
//                       text: mobileNumber,
//                       style: const TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             IconButton(
//               onPressed: onPop ?? context.pop, 
//               icon: const Icon(Icons.close, color: Colors.red),
//             ),
//           ],
//         ),
//         content: SizedBox(
//           width: context.sizeOfWidth - 24,
//           child: LoginVerification.provideBloc(mobileNumber, type),
//         ),
//       ),
//     ) ?? false;
//   }
// }
