

// import 'dart:math' as math;

// import 'package:flutter/foundation.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:offline_first/app/model/otp_request_type.dart';
// import 'package:offline_first/core/core.dart';
// import 'package:offline_first/features/auth/presentation/bloc/auth/auth_cubit.dart';
// import 'package:offline_first/features/auth/presentation/bloc/sign_in/sign_in_cubit.dart';
// import 'package:offline_first/styles/app_color.dart';
// import 'package:offline_first/styles/app_icons.dart';
// import 'package:offline_first/widgets/app_spacer.dart';
// import 'package:offline_first/widgets/buttons/app_btn.dart';
// import 'package:offline_first/widgets/dailogs/app_dialogs.dart';
// import 'package:offline_first/widgets/inputs/app_text_field.dart';
// import 'package:offline_first/widgets/otp_verf_dialog.dart';
// import 'package:offline_first/widgets/spaced_column.dart';


// class AuthenticationScrn extends StatefulWidget {
//   const AuthenticationScrn({super.key});

//   @override
//   State<AuthenticationScrn> createState() => _AuthenticationScrnState();
// }

// class _AuthenticationScrnState extends State<AuthenticationScrn> {
//   late final TextEditingController username;
//   late final TextEditingController pswd;
//   bool showPswd = true;

//   @override
//   void initState() {
//     super.initState();
//     username = TextEditingController();
//     pswd = TextEditingController();
//   }

//   void togglePswd() => setState(() {
//         showPswd = !showPswd;
//       });

//   String generateOTP() {
//     final secureRandom = math.Random.secure();
//     final otp = secureRandom.nextInt(900000) + 100000;
//     return otp.toString();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: SpacedColumn(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             margin: const EdgeInsets.all(12.0),
//             defaultHeight: 12.0,
//             children: [
//               SizedBox(
//                 width: context.sizeOfWidth,
//                 child: AppIcons.m11BgLogo.toWidget(height: 120),
//               ),
//               Text(
//                 'Sign In',
//                 style: context.textTheme.labelLarge?.copyWith(
//                   color: AppColors.black,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 16,
//                 ),
//               ),
//               Text(
//                 "Hi Welcome back, you've been missed",
//                 style: context.textTheme.labelLarge?.copyWith(
//                   color: AppColors.black,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               AppSpacer.p12(),
//               AppTextField(
//                 title: 'User ID',
//                 isRequired: true,
//                 controller: username,
//               ),
//               AppTextField(
//                 title: 'Password',
//                 isRequired: true,
//                 controller: pswd,
//                 obscureText: showPswd,
//                 suffix: InkWell(
//                   onTap: togglePswd,
//                   child: Text(
//                     showPswd ? ' show ' : ' hide ',
//                     style: context.textTheme.titleMedium?.copyWith(
//                       color: Colors.transparent,
//                       shadows: [
//                         const Shadow(
//                             color: AppColors.green, offset: Offset(0, -5)),
//                       ],
//                       decorationColor: AppColors.green,
//                       decoration: TextDecoration.underline,
//                       height: 1.5,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//               Align(
//                 alignment: Alignment.bottomRight,
//                 child: GestureDetector(
//                   // onTap: () => AppRoute.forgotpswd.push(context),
//                   child: Text(
//                     'Forgot Password?',
//                     style: context.textTheme.labelLarge?.copyWith(
//                       color: AppColors.darkBlue,
//                       decoration: TextDecoration.underline,
//                       decorationColor: AppColors.darkBlue,
//                     ),
//                   ),
//                 ),
//               ),
//               BlocConsumer<SignInCubit, SignInState>(
//                 listener: (_, state) {
//                   state.maybeWhen(
//                     orElse: () {},
//                     success: (data) async {
//                       // final generatedOTP = generateOTP();
//                       // context.cubit<ResendOTPCubit>().request(OTPInput(
//                       //       type: OTPRequestType.registration,
//                       //       number: data.mobileNo ?? '',
//                       //       otp: generatedOTP,
//                       //     ));

//                       // final cubit = context.cubit<RegistrationCubit>();

//                       if (data.mobileNo == null || data.mobileNo == '') {
//                         if (!context.mounted) return;

//                         AppDialog.showErrorDialog(context,
//                             content:
//                                 'No mobile number is linked to this account. Please contact the administrator.',
//                             onTapDismiss: context.exit);
//                         return;
//                       }

//                       if (!Urls.isTest) {
//                         final isVerified =
//                             await OTPVerfDialog.launchOTPVerfDialog(
//                           context,
//                           mobileNumber: data.mobileNo ?? '',
//                           type: OTPRequestType.registration,
//                         );
//                         if (isVerified && context.mounted) {
//                           context
//                               .cubit<AuthCubit>()
//                               .authCheckRequested(isOtpverified: true);
//                         }
//                       } else {
//                          context
//                               .cubit<AuthCubit>()
//                               .authCheckRequested(isOtpverified: true);
//                       }
//                     },
//                     failure: (failure) => AppDialog.showErrorDialog(context,
//                         content: failure.error, onTapDismiss: context.exit),
//                   );
//                 },
//                 builder: (_, state) {
//                   return AppButton(
//                     label: 'Sign In',
//                     bgColor: AppColors.darkBlue,
//                     isLoading: state.isLoading,
//                     margin: const EdgeInsets.all(12),
//                     onPressed: () => context
//                         .cubit<SignInCubit>()
//                         .login(username.text, pswd.text),
//                   );
//                 },
//               ),
//               const _TermsAndConditions(),
//               AppSpacer.p12(),
//               _registerWidget(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _registerWidget() => Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 8.0),
//         child: RichText(
//           textAlign: TextAlign.center,
//           text: TextSpan(
//             style: context.textTheme.labelLarge?.copyWith(
//               fontWeight: FontWeight.bold,
//             ),
//             children: [
//               const TextSpan(text: 'Dont have an account? '),
//               // TextSpan(
//               //   recognizer: TapGestureRecognizer()..onTap = _goToRegistration,
//               //   text: ' Sign Up',
//               //   style: const TextStyle(color: AppColors.darkBlue),
//               // ),
//             ],
//           ),
//         ),
//       );

//   // void _goToRegistration() => AppRoute.register.push(context);
// }

// class _TermsAndConditions extends StatelessWidget {
//   const _TermsAndConditions();

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         const Text('By continuing you agree to'),
//         RichText(
//           text: TextSpan(
//             style: context.textTheme.titleSmall?.copyWith(
//               color: AppColors.darkBlue,
//               fontSize: 12,
//               fontWeight: FontWeight.w600,
//             ),
//             children: const [
//               TextSpan(text: 'Our Terms'),
//               TextSpan(text: '  &  ', style: TextStyle(color: AppColors.black)),
//               TextSpan(text: 'Privacy'),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

