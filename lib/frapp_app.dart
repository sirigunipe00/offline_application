import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offline_first/app/presentation/bloc/geo_permission/geo_permission_handler.dart';
import 'package:offline_first/auth/presentation/bloc/auth/auth_cubit.dart';
import 'package:offline_first/auth/presentation/ui/sign_in/sign_in_cubit.dart';
import 'package:offline_first/core/core.dart';


import 'package:offline_first/styles/material_theme.dart';




class OfflineFrist extends StatefulWidget {
  const OfflineFrist({super.key});

  @override
  State<OfflineFrist> createState() => _OfflineFristState();
}

class _OfflineFristState extends State<OfflineFrist>
    with WidgetsBindingObserver {
  bool _shouldRequestPermission = false;

  @override
  void initState() {
    // $sl.get<NotificationUsecase>().updateOSDetails();
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      if (_shouldRequestPermission) {
        _shouldRequestPermission = false;
        handleCallBack();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => $sl.get<AuthCubit>()..authCheckRequested()),
        BlocProvider(create: (_) => $sl.get<SignInCubit>()),



        // BlocProvider<GeoPermissionHandler>(
        //   create: (_) => GeoPermissionHandler(),
        // ),

      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthCubit, AuthState>(
            listener: (_, state) {
              final routerCtxt =
                  AppRouterConfig.parentNavigatorKey.currentContext;
              if (routerCtxt == null) return;
              state.maybeWhen(
                authenticated: () {
                 AppRoute.home.go(routerCtxt);
                },
                unAuthenticated: () {
                  AppRoute.login.go(routerCtxt);
                },
                orElse: () {
                  AppRoute.login.go(routerCtxt);
                },
              );
            },
          ),

          // BlocListener<GeoPermissionHandler, GeoPermissionState>(
          //   listenWhen: (previous, current) => previous != current,
          //   listener: (_, state) async {
          //     final routerCtxt = AppRouterConfig.context;
          //     if (state is GeoLocationDenied) {
          //       log('GeoLocationDenied     ........');
          //       Geolocator.requestPermission().then((_) {
          //         routerCtxt.cubit<GeoPermissionHandler>().checkPermission();
          //       });
          //       return;
          //     }
          //     if (state is GeoLocationDeniedForever ||
          //         state is LocationPermissionPermDenied) {

          //       log('GeoLocationDeniedForever     ........');
          //       AppDialog.showErrorDialog<bool?>(
          //         routerCtxt,
          //         barrierDismissible: false,
          //         title: 'Grant Location Permission',
          //         content: 'Shakti Hormann needs your location permission',
          //         buttonText: 'Allow',
          //         onTapDismiss: () => routerCtxt.exit(true),
          //       ).then((value) async {
          //         if (value.isTrue) {
          //           _shouldRequestPermission = true;
          //           await Geolocator.openAppSettings();
          //         }
          //       });
          //     }
          //   },
          // ),
        ],
        child: MaterialApp.router(
          title: 'Shakti Hormann',
          theme: AppMaterialTheme.lightTheme,
          darkTheme: AppMaterialTheme.lightTheme,
          routerConfig: AppRouterConfig.router,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }

  void handleCallBack() {
    final context = AppRouterConfig.context;
    context.cubit<GeoPermissionHandler>().checkPermission();
  }
}