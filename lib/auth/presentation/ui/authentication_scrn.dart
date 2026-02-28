import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:offline_first/auth/presentation/bloc/auth/auth_cubit.dart';
import 'package:offline_first/auth/presentation/ui/sign_in/sign_in_cubit.dart';
import 'package:offline_first/widgets/app_bar.dart';
import 'package:offline_first/core/core.dart';

import 'package:offline_first/widgets/forgot_password.dart';
import 'package:offline_first/styles/app_color.dart';
import 'package:offline_first/widgets/buttons/app_btn.dart';
import 'package:offline_first/widgets/dailogs/app_dialogs.dart';
import 'package:offline_first/widgets/inputs/app_text_field.dart';

class LoginScrnWidget extends StatefulWidget {
  const LoginScrnWidget({super.key});

  @override
  State<LoginScrnWidget> createState() => _LoginScrnWidgetState();
}

class _LoginScrnWidgetState extends State<LoginScrnWidget> {
  bool _obscureText = true;
  late final TextEditingController username;
  late final TextEditingController pswd;

  @override
  void initState() {
    super.initState();
    username = TextEditingController();
    pswd = TextEditingController();
  }

  @override
  void dispose() {
    username.dispose();
    pswd.dispose();
    super.dispose();
  }

  bool get isFormFilled => username.text.isNotEmpty && pswd.text.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const CustomAppBar(),
                  const SizedBox(height: 20),

                  const Text(
                    'Welcome back! Glad\nto see you, Again!',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Urbanist',
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 30),

                  AppTextField(
                    title: 'Email',
                    hintText: 'Enter Your Email',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset(
                        'assets/images/mail.svg',
                        width: 24,
                        height: 24,
                      ),
                    ),
                    controller: username,
                    inputType: TextInputType.emailAddress,
                    onChanged: (_) => setState(() {}),
                  ),
                  const SizedBox(height: 16),

                  AppTextField(
                    obscureText: _obscureText,
                    title: 'Password',
                    hintText: 'Enter Your Password',
                    controller: pswd,
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() => _obscureText = !_obscureText);
                      },
                      child: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey,
                      ),
                    ),
                    inputType: TextInputType.visiblePassword,
                    onChanged: (_) => setState(() {}),
                  ),
                  const SizedBox(height: 4),

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ForgotPasswordPage(),
                          ),
                        );
                      },
                      child: const SizedBox()
                      // const Text(
                      //   'Forgot Password?',
                      //   style: TextStyle(
                      //     color: Color(0xFF0095FF),
                      //     fontWeight: FontWeight.w600,
                      //     fontFamily: 'Urbanist',
                      //   ),
                      // ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  BlocConsumer<SignInCubit, SignInState>(
                    listener: (context, state) {
                      state.maybeWhen(
                        orElse: () {},
                        success: context.cubit<AuthCubit>().authCheckRequested,
                        failure:
                            (failure) => AppDialog.showErrorDialog(
                              context,
                              title: failure.title,
                              content: failure.error,
                              onTapDismiss: context.close,
                            ),
                      );
                    },
                    builder: (context, state) {
                      return state.maybeWhen(
                        loading:
                            () => const Center(
                              child: CircularProgressIndicator(
                                color: AppColors.darkBlue,
                              ),
                            ),
                        orElse:
                            () => AppButton(
                              bgColor:
                                  isFormFilled
                                      ? AppColors.darkBlue
                                      : AppColors.grey,
                              label: 'Login',
                              onPressed: () {
                                context.cubit<SignInCubit>().login(
                                  username.text,
                                  pswd.text,
                                );
                              },
                            ),
                      );
                    },
                  ),

                  // const SizedBox(height: 250),

                  // Center(
                  //   child: Column(
                  //     children: [
                  //       SvgPicture.asset(
                  //         'assets/logo/EasyCloud Logo 150 x 80.svg',
                  //         width: 78,
                  //         height: 40,
                  //         fit: BoxFit.fitWidth,
                  //       ),
                  //       const SizedBox(height: 8),
                  //       const Text(
                  //         'Powered by EasyCloud',
                  //         style: TextStyle(
                  //           fontSize: 14,
                  //           color: Colors.black54,
                  //           fontWeight: FontWeight.w700,
                  //           fontFamily: 'Urbanist',
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
