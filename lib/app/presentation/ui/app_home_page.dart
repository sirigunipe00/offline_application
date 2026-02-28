import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:offline_first/app/presentation/bloc/app_update_bloc_provider.dart';
import 'package:offline_first/app/presentation/widgets/dashboard_item.dart';
import 'package:offline_first/app/presentation/widgets/greeting_widget.dart';
import 'package:offline_first/auth/model/logged_in_user.dart';
import 'package:offline_first/core/core.dart';
import 'package:offline_first/styles/app_icons.dart';
import 'package:offline_first/widgets/app_update_dailog.dart';


class AppHomePage extends StatefulWidget {
  const AppHomePage({super.key});

  @override
  State<AppHomePage> createState() => _AppHomePageState();
}

class _AppHomePageState extends State<AppHomePage> {
  @override
  void initState() {
    super.initState();


    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );
  }

  final List<DashboardItem> dashboardItems = [
    DashboardItem(
      title: 'Gate Entry',
      icon: AppIcons.gateeEntry,
      onTap: (context) {
        AppRoute.gateEntry.push<bool?>(context);
      },
      permissionSelector: (roleStatus) => roleStatus?.showGateEntry,
    ),
    DashboardItem(
      title: 'Gate Exit',
      icon: AppIcons.gateExit,
      onTap: (context) {
        AppRoute.gatexit.push<bool?>(context);
      },
      permissionSelector: (roleStatus) => roleStatus?.showGateExit,
    ),
    DashboardItem(
      title: 'Logistic Request',
      icon: AppIcons.logisticRequest,
      onTap: (context) {
        AppRoute.logisticRequest.push<bool?>(context);
      },
      permissionSelector: (roleStatus) => roleStatus?.showLogisticRequest,
    ),
    DashboardItem(
      title: 'Transport\nConfirmation',
      icon: AppIcons.transportrterConfirmation,
      onTap: (context) {
        AppRoute.transportConfirmation.push<bool?>(context);
      },
      permissionSelector:
          (roleStatus) => roleStatus?.showTransporterConfirmation,
    ),
    DashboardItem(
      title: 'Vehicle Reporting\nEntry',
      icon: AppIcons.vehicleReporting,
      onTap: (context) {
        AppRoute.vehcileReporting.push<bool?>(context);
      },
      permissionSelector: (roleStatus) => roleStatus?.showVehicleReporting,
    ),
    DashboardItem(
      title: 'Dispatch\nLoading',
      icon: AppIcons.loadingConfirmation,
      onTap: (context) {
        AppRoute.loadingConfirmation.push<bool?>(context);
      },
      permissionSelector: (roleStatus) => roleStatus?.showLoadingConfirmation,
    ),
    DashboardItem(
      title: 'Proof Of Delivery',
      icon: AppIcons.pod,
      onTap: (context) {
        AppRoute.proofOfDelivery.push<bool?>(context);
      },
      permissionSelector: (roleStatus) => roleStatus?.showpod,
    ),
    DashboardItem(
      title: 'Gate Management',
      icon: AppIcons.gatemanagement,
      iconSize: const Size(140, 80),
      onTap: (context) {
        AppRoute.gateManagement.push<bool?>(context);
      },
      permissionSelector: (roleStatus) => roleStatus?.showgaetManagement,
    ),
  ];

  Widget buildDashboardCard(DashboardItem item) {
    return GestureDetector(
      onTap: () => item.onTap(context),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),

          color: Colors.white,
          border: Border.all(color: const Color(0xFFE8ECF4), width: 2),
          boxShadow: const [
            BoxShadow(
              color: Color(0xFFFFFFFF),
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // item.icon.toWidget(height: 60, width: 100),
            item.icon.toWidget(
              height: item.iconSize?.height ?? 60,
              width: item.iconSize?.width ?? 100,
            ),

            const SizedBox(height: 10),
            Text(
              item.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                fontFamily: 'Urbanist',
                color: Color(0xFF0E1446),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    LoggedInUser? user;
    try {
      user = $sl<LoggedInUser>();
    } catch (_) {
      user = null;
    }

    final roleStatus = user?.roleStatus;

    final visibleItems =
        dashboardItems
            .where((item) => item.permissionSelector(roleStatus) == 1)
            .toList();
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      body: SafeArea(
        child: MultiBlocListener(
          listeners: [
            BlocListener<AppVersionCubit, AppVersionCubitState>(
              listener: (context, state) {
                state.maybeWhen(
                  orElse: () {},
                  success: (data) {
                    if (data) {
                      showDialog(
                        context: context,
                        builder:
                            (ctx) => const AppUpdateDialog(
                              appName: 'ShaktiHormann',
                              packageName: 'in.easycloud.offline_first',
                            ),
                        barrierDismissible: false,
                      );
                    }
                  },
                );
              },
            ),
            // BlocListener<GeoPermissionHandler, GeoPermissionState>(
            //   listenWhen: (previous, current) => previous != current,
            //   listener: (_, state) async {
            //     final routerCtxt = AppRouterConfig.context;

            //     log('state..:$state');
            //     if (state is GeoLocationServiceDisabled) {
            //       print('true...:');
            //       showDialog(
            //         context: context,
            //         barrierDismissible: false,
            //         builder:
            //             (_) => AlertDialog(
            //               title: const Text('Location Disabled'),
            //               content: const Text(
            //                 'Please enable location to continue.',
            //               ),
            //               actions: [
            //                 TextButton(
            //                   onPressed: () async {
            //                     await Geolocator.openLocationSettings();
            //                     context
            //                         .read<GeoPermissionHandler>()
            //                         .checkPermission();
            //                   },
            //                   child: const Text('Enable'),
            //                 ),
            //               ],
            //             ),
            //       );
            //     }
            //     if (state is GeoLocationDenied) {
            //       Geolocator.requestPermission().then((_) {
            //         routerCtxt.cubit<GeoPermissionHandler>().checkPermission();
            //       });
            //       return;
            //     }
            //     if (state is GeoLocationDeniedForever ||
            //         state is LocationPermissionPermDenied) {
            //       AppDialog.showErrorDialog<bool?>(
            //         routerCtxt,
            //         barrierDismissible: false,
            //         title: 'Grant Location Permission',
            //         content: 'Shakti Hormann needs your location permission',
            //         buttonText: 'Allow',
            //         onTapDismiss: () => routerCtxt.exit(true),
            //       ).then((value) async {
            //         if (value!.isTrue) {
            //           _shouldRequestPermission = true;
            //           await Geolocator.openAppSettings();
            //         }
            //       });
            //     }
            //   },
            // ),
          ],

          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const GreetingHeader(),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: GestureDetector(
                        onTap: () => AppRoute.notifications.push(context),
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.05),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Center(
                                child: SvgPicture.asset(
                                  'assets/images/notification.svg',
                                  height: 24,
                                  width: 24,
                                ),
                              ),
                              Positioned(
                                top: -2,
                                right: -2,
                                child: Container(
                                  width: 12,
                                  height: 12,
                                  decoration: BoxDecoration(
                                    color: Colors.redAccent,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 0.5,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // const TaskWidget(
              //   title: "Your Today's Task",
              //   subtitle: 'Almost done!',
              //   icon: Icons.check_circle,
              //   onCancel: null,
              // ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GridView.builder(
                    itemCount: visibleItems.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                    itemBuilder: (context, index) {
                      return buildDashboardCard(visibleItems[index]);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
