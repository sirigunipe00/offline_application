

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:offline_first/auth/presentation/bloc/auth/auth_cubit.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:offline_first/core/core.dart';

import 'dart:math' as math;
import 'package:offline_first/styles/app_color.dart';
import 'package:offline_first/widgets/buttons/app_btn.dart';

class AppProfilePage extends StatelessWidget {
  const AppProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    // final height = size.height;
    // final width = size.width;
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final height = constraints.maxHeight;
          final width = constraints.maxWidth;
          return Column(
            children: [
              Container(
                height: height * 0.28,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFFFDCB27),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: SafeArea(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: width * 0.04,
                          vertical: height * 0.015,
                        ),
                        child: const Row(
                          children: [
                            SizedBox(width: 8),
                            Text(
                              'Profile',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: height * 0.01),
                      SvgPicture.asset(
                        'assets/images/hormann_logo.svg',
                        height: height * 0.05,
                      ),
                      SizedBox(height: height * 0.02),
                    ],
                  ),
                ),
              ),

              Expanded(
                child: Column(
                  children: [
                    Transform.translate(
                      offset: Offset(0, -height * 0.06),
                      child: Container(
                        width: width * 0.85,
                        padding: EdgeInsets.all(width * 0.05),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24),
                          border: const Border(
                            bottom: BorderSide(
                              color: AppColors.darkBlue,
                              width: 10,
                            ),
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10,
                              spreadRadius: 2,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                
                            
                            Stack(
                              children: [
                                Container(
                                padding: EdgeInsets.all(width * 0.02),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(60),
                                  // shape: BoxShape.circle,
                                  border: Border.all(
                                    color: AppColors.darkBlue,
                                    width: 2,
                                  ),
                                ),
                                child: CircleAvatar(
                                  radius: width * 0.09,
                                  backgroundColor: Colors.transparent,
                                  child: Icon(
                                    Icons.person,
                                    size: width * 0.12,
                                    color: const Color(0xFFFDCB27),
                                  ),
                                ),
                              ),
                
                              Positioned.fill(
                              child: CustomPaint(
                                  painter: _RightArcPainter(),
                                ),
                            ),
                
                              ],
                            ),
                            
                
                            
                            // 🟡 Right-Side Yellow Arc
                             
                            SizedBox(height: height * 0.015),
                            Text(
                              context.user.firstName ?? '',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: width * 0.045,
                                color: Colors.black,
                                fontFamily: 'Urbanist',
                              ),
                            ),
                            SizedBox(height: height * 0.02),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: width * 0.04,
                                vertical: height * 0.008,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.darkBlue,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                context.user.email.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: width * 0.035,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                
                    _infoRow(
                      'Company',
                      const Text(
                        'Shakti Hormann Private Limited',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                
                    _infoRow(
                      'App Version',
                      FutureBuilder<String>(
                        future: _appversion(),
                        builder: (_, snapshot) {
                          if (snapshot.connectionState ==
                                  ConnectionState.done &&
                              snapshot.hasData) {
                            return Text(
                              snapshot.data!,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w600,
                              ),
                            );
                          }
                          return const SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          );
                        },
                      ),
                    ),
                
                    SizedBox(height: height * 0.035),
                
                    Center(
                      child: AppButton(
                        label: 'Logout',
                        width: width * 0.85,
                        icon: Transform.rotate(
                          angle: 180 * math.pi / 180,
                          child: const Icon(
                            Icons.logout_outlined,
                            color: AppColors.white,
                          ),
                        ),
                        onPressed: context.cubit<AuthCubit>().signOut,
                        bgColor: AppColors.darkBlue,
                        margin: EdgeInsets.symmetric(
                          horizontal: width * 0.08,
                        ),
                      ),
                    ),
                
                    // SizedBox(height: height * 0.08),
                
                    // Column(
                    //   children: [
                    //     SvgPicture.asset(
                    //       'assets/logo/EasyCloud Logo 150 x 80.svg',
                    //       height: height * 0.05,
                    //       fit: BoxFit.contain,
                    //     ),
                    //     SizedBox(height: height * 0.005),
                    //     const Text(
                    //       'Powered by EasyCloud',
                    //       style: TextStyle(
                    //         fontSize: 14,
                    //         color: Colors.grey,
                    //         fontFamily: 'Urbanist',
                    //         fontWeight: FontWeight.w700,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  static Widget _infoRow(String label, Widget value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black12, width: 1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.w600,
            ),
          ),
          value,
        ],
      ),
    );
  }
}

Future<String> _appversion() async {
  final pinfo = await PackageInfo.fromPlatform();
  final version = pinfo.version;
  final buildNumber = pinfo.buildNumber;
  return '$version ($buildNumber)';
}

class _RightArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFFDCB27)
      ..strokeWidth = 6.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;


    const double extra = 6; 
    final rect = Rect.fromLTWH(
      -extra,
      -extra,
      size.width + extra * 2, 
      size.height + extra * 2, 
    );

    canvas.drawArc(
      rect.deflate(2),
      math.pi * 1.5,
      math.pi / 0.9, 
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

