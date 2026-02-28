// import 'dart:math' as math;

// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:offline_first/app/model/otp_inp.dart';
// import 'package:offline_first/app/model/otp_request_type.dart';
// import 'package:offline_first/app/presentation/bloc/bloc_provider.dart';
// import 'package:offline_first/core/core.dart';
// import 'package:offline_first/styles/app_color.dart';
// import 'package:offline_first/styles/text_styles.dart';
// import 'package:offline_first/widgets/buttons/app_btn.dart';
// import 'package:offline_first/widgets/dailogs/app_dialogs.dart';
// import 'package:offline_first/widgets/dailogs/app_snack_bar_widget.dart';


// import 'package:offline_first/widgets/inputs/otp_text_field.dart';
// import 'package:offline_first/widgets/spaced_column.dart';


// class LoginVerification extends StatefulWidget {
//   const LoginVerification({
//     super.key,
//     required this.mobileNumber,
//     this.token,
//     required this.type,
//   });

//   final OTPRequestType type;
//   final String mobileNumber;
//   final String? token;

//   static Widget provideBloc(String mobileNum, OTPRequestType type) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(create: (_) => AppBlocProvider.get().resendOTPCubit()),
//       ],
//       child: LoginVerification(
//         type: type,
//         mobileNumber: mobileNum,
//       ),
//     );
//   }

//   @override
//   State<LoginVerification> createState() => _LoginVerificationState();
// }

// class _LoginVerificationState extends State<LoginVerification> {
//   String? enteredOtp;
//   late String generatedOTP;
//   final otpController = OtpFieldController();
//   @override
//   void initState() {
//     generatedOTP = generateOTP();
//     sendOTP();
//     super.initState();
//   }

//   String generateOTP() {
//     final secureRandom = math.Random.secure();
//     final otp = secureRandom.nextInt(900000) + 100000;
//     return otp.toString();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return PopScope(
//       canPop: false,
//       child: MultiBlocListener(
//         listeners: [
//           BlocListener<ResendOTPCubit, ResendOTPCubitState>(
//             listener: (_, state) {
//               state.handle(context, success: (data) {
//                 AppDialog.showSuccessDialog(
//                   context,
//                   content: 'An OTP has been shared successfully',
//                   onTapDismiss: context.exit,
//                 );
//                 setState(() {
//                   enteredOtp = null;
//                   otpController.clear();
//                 });
//               });
//             },
//           ),
//         ],
//         child: SpacedColumn(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           defaultHeight: 16,
//           children: [
//             OTPTextField(
//               length: 6,
//               controller: otpController,
//               width: context.sizeOfWidth,
//               textFieldAlignment: MainAxisAlignment.spaceAround,
//               fieldWidth: 52,
//               fieldStyle: FieldStyle.box,
//               outlineBorderRadius: 12,
//               style: const TextStyle(fontSize: 17),
//               onChanged: (pin) {
//                 setState(() {
//                   enteredOtp = pin;
//                 });
//               },
//               onCompleted: (pin) {},
//             ),
//             BlocBuilder<ResendOTPCubit, ResendOTPCubitState>(
//               builder: (_, state) {
//                 return Visibility(
//                   visible: !state.isLoading,
//                   child: RichText(
//                     text: TextSpan(
//                       style: TextStyles.titleBold(context)
//                           .copyWith(color: Colors.black),
//                       text: "Didn't receive OTP? ",
//                       children: [
//                         TextSpan(
//                           text: 'Resend',
//                           style: const TextStyle(color: AppColors.darkBlue),
//                           recognizer: TapGestureRecognizer()..onTap = sendOTP,
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//             BlocBuilder<ResendOTPCubit, ResendOTPCubitState>(
//               builder: (_, state) {
//                 return AppButton(
//                   bgColor: AppColors.darkBlue,
//                   isLoading: state.isLoading,
//                   loadingText: 'Please wait...',
//                   label: 'Verify',
//                   onPressed: () {
//                     if (enteredOtp.isNull) {
//                       context.showSnackbar('Enter OTP', AppSnackBarType.error);
//                       return;
//                     } else if (enteredOtp!.length != 6) {
//                       context.showSnackbar('Enter 6 Digit Valid OTP', AppSnackBarType.error);
//                       return;
//                     }
//                     if (enteredOtp == generatedOTP) {
//                       context.exit(true);
//                     } else {
//                       context.showSnackbar('Please enter Valid OTP', AppSnackBarType.error);
//                     }
//                   },
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void sendOTP() {
//     generatedOTP = generateOTP();
//     context.cubit<ResendOTPCubit>().request(OTPInput(
//           type: widget.type,
//           number: widget.mobileNumber,
//           otp: generatedOTP,
//         ));
//   }
// }
