import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:offline_first/app/presentation/bloc/app_update_bloc_provider.dart';
import 'package:offline_first/app/presentation/ui/app_profile_page.dart';
import 'package:offline_first/app/presentation/ui/app_splash_scrn.dart';
import 'package:offline_first/app/presentation/widgets/app_scaffold_widget.dart';
import 'package:offline_first/auth/presentation/ui/authentication_scrn.dart';
import 'package:offline_first/core/core.dart';
import 'package:offline_first/offline_image.dart';



class AppRouterConfig {
  static final parentNavigatorKey = GlobalKey<NavigatorState>();
  static final context = parentNavigatorKey.currentState!.context;

  static int dashboardStatus = 0;

  static void setDashboardStatus(int status) {
    dashboardStatus = status;
  }

  static final GoRouter router = GoRouter(
    navigatorKey: parentNavigatorKey,
    initialLocation: AppRoute.login.path,
    routes: <RouteBase>[
        GoRoute(
        path: AppRoute.initial.path,
        builder: (_, state) => const AppSplashScrn(),
      ),
      GoRoute(
        path: AppRoute.login.path,
        builder: (_, state) => const LoginScrnWidget(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return AppScaffoldWidget(navigationShell: navigationShell);
        },

        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoute.home.path,
                builder:
                    (_, state) => BlocProvider(
                      create:
                          (_) =>
                              AppUpdateBlocprovider.get().appversionCubit()
                                ..request(),
                      child: const OfflineImageApp(),
                    ),
                routes: const [
                  // GoRoute(
                    
                  //   path: _getPath(AppRoute.notifications),
                    
                  //   // final form = state.extra as Notif?;
                  //   builder: (ctxt, state) => MultiBlocProvider(providers: [
                  //     BlocProvider(
                  //       create:
                  //           (_) =>
                  //               NotificationBlocProvider.get()
                  //                   .fetchNotifications()..request(),
                  //     ),
                  //   ],
                  //   child: const NotificationListScreen()),
                  // ),
                  // GoRoute(
                  //   path: _getPath(AppRoute.gateEntry),
                  //   builder: (ctxt, state) {
                  //     final filters = Pair(
                  //       StringUtils.docStatusInt('Draft'),
                  //       null,
                  //     );
                  //     return BlocProvider(
                  //       create:
                  //           (context) =>
                  //               GateEntryBlocProvider.get().fetchGateEntries()
                  //                 ..fetchInitial(filters),
                  //       child: const GateEntryListScrn(),
                  //     );
                  //   },
                  //   routes: [
                  //     GoRoute(
                  //       path: _getPath(AppRoute.newGateEntry),
                  //       onExit: (context, state) async {
                  //         final form = state.extra as GateEntryForm?;
                  //         final formStatus =
                  //             form?.docStatus == 1 ? 'Submitted' : 'Draft';
                  //         return await _promptConf(
                  //           context,
                  //           formStatus: formStatus,
                  //         );
                  //       },
                  //       builder: (_, state) {
                  //         final gateEntryForm = state.extra as GateEntryForm?;
                  //         return MultiBlocProvider(
                  //           providers: [
                  //             BlocProvider(
                  //               create:
                  //                   (_) =>
                  //                       GateEntryBlocProvider.get()
                  //                           .purchaseOrderList()
                  //                         ..request(''),
                  //             ),
                  //             BlocProvider(
                  //               create:
                  //                   (_) =>
                  //                       GateEntryBlocProvider.get()
                  //                           .gateNumberList()
                  //                         ..request(''),
                  //             ),

                  //             BlocProvider(
                  //               create:
                  //                   (_) =>
                  //                       $sl.get<CreateGateEntryCubit>()
                  //                         ..initDetails(gateEntryForm),
                  //             ),

                  //             BlocProvider(
                  //               create:
                  //                   (_) =>
                  //                       GateEntryBlocProvider.get()
                  //                           .getPurchase()
                  //                         ..request(gateEntryForm?.name ?? ''),
                  //             ),
                  //           ],
                  //           child: const NewGateEntry(),
                  //         );
                  //       },
                  //     ),
                  //   ],
                  // ),
                  // GoRoute(
                  //   path: _getPath(AppRoute.gatexit),
                  //   builder: (ctxt, state) {
                  //     final filters = Pair(
                  //       StringUtils.docStatusInt('Draft'),
                  //       null,
                  //     );
                  //     return BlocProvider(
                  //       create:
                  //           (context) =>
                  //               GateExitBlocProvider.get().fetchGateExit()
                  //                 ..fetchInitial(filters),
                  //       child: const GateExitListScrn(),
                  //     );
                  //   },
                  //   routes: [
                  //     GoRoute(
                  //       onExit: (context, state) async {
                  //         final form = state.extra as GateExitForm?;
                  //         final formStatus =
                  //             form?.docStatus == 1 ? 'Submitted' : 'Draft';
                  //         return await _promptConf(
                  //           context,
                  //           formStatus: formStatus,
                  //         );
                  //       },
                  //       path: _getPath(AppRoute.newGateExit),
                  //       builder: (_, state) {
                  //         final form = state.extra as GateExitForm?;
                  //         print('form?.name ?? ''${form?.name}');
                  //         return MultiBlocProvider(
                  //           providers: [
                  //             BlocProvider(
                  //               create:
                  //                   (_) =>
                  //                       GateExitBlocProvider.get()
                  //                           .salesInvoiceList()
                  //                         ..request(''),
                  //             ),
                  //              BlocProvider(
                  //               create:
                  //                   (_) =>
                  //                       GateExitBlocProvider.get()
                  //                           .getSales()
                  //                         ..request(form?.name ?? ''),
                                          
                  //             ),
                  //             BlocProvider(
                  //               create:
                  //                   (_) =>
                  //                       $sl.get<CreateGateExitCubit>()
                  //                         ..initDetails(form),
                  //             ),
                  //           ],
                  //           child: const NewGateExit(),
                  //         );
                  //       },
                  //     ),
                  //   ],
                  // ),
                  // GoRoute(
                  //   path: _getPath(AppRoute.logisticRequest),
                  //   builder: (ctxt, state) {
                  //     final filters = Pair(
                  //       StringUtils.docStatuslogistic('Draft'),
                  //       null,
                  //     );
                  //     return BlocProvider(
                  //       create:
                  //           (context) =>
                  //               LogisticPlanningBlocProvider.get()
                  //                   .fetchLogistics()
                  //                 ..fetchInitial(filters),
                  //       child: const LogisticRequestList(),
                  //     );
                  //   },
                  //   routes: [
                  //     GoRoute(
                  //       path: _getPath(AppRoute.newLogisticRequest),
                  //       onExit: (context, state) async {
                  //         final form = state.extra as LogisticPlanningForm?;
                  //         final formStatus =
                  //             form?.docstatus == 1 ? 'Submitted' : 'Draft';
                  //         return _promptConf(context, formStatus: formStatus);
                  //       },
                  //       builder: (_, state) {
                  //         final bloc = LogisticPlanningBlocProvider.get();
                  //         final logisticForm =
                  //             state.extra as LogisticPlanningForm?;

                  //         return MultiBlocProvider(
                  //           providers: [
                  //             BlocProvider(
                  //               create:
                  //                   (_) =>
                  //                       $sl.get<CreateLogisticCubit>()
                  //                         ..initDetails(logisticForm),
                  //             ),
                  //             BlocProvider(
                  //               create:
                  //                   (_) => bloc.salesOrderList()..request(''),
                  //             ),
                  //             BlocProvider(
                  //               create:
                  //                   (_) => bloc.transportersList()..request(''),
                  //             ),
                  //             BlocProvider(
                  //               create: (_) => bloc.vehicleList()..request(''),
                  //             ),
                  //             BlocProvider(
                  //               create:
                  //                   (_) =>
                  //                       bloc.salesList()
                  //                         ..request(logisticForm?.name ?? ''),
                  //             ),
                  //           ],
                  //           child: const NewLogisticRequest(),
                  //         );
                  //       },
                  //     ),
                  //   ],
                  // ),
                  // GoRoute(
                  //   path: _getPath(AppRoute.transportConfirmation),
                  //   builder: (ctxt, state) {
                  //     final filters = Pair(
                  //       StringUtils.docStatuslogistic(
                  //         'Pending From Transporter',
                  //       ),
                  //       null,
                  //     );
                  //     return BlocProvider(
                  //       create:
                  //           (context) =>
                  //               TransportCnfmBlocProvider.get().fetchTransport()
                  //                 ..fetchInitial(filters),
                  //       child: const TransportCnfmList(),
                  //     );
                  //   },
                  //   routes: [
                  //     GoRoute(
                  //       path: _getPath(AppRoute.newTarnsportCnfrm),
                  //       onExit: (context, state) async {
                  //         final form =
                  //             state.extra as TransportConfirmationForm?;
                  //         final formStatus =
                  //             form?.docstatus == 1 ? 'Submitted' : 'Draft';
                  //         return _promptConf(context, formStatus: formStatus);
                  //       },
                  //       builder: (_, state) {
                  //         final bloc = LogisticPlanningBlocProvider.get();

                  //         final form = state.extra;
                  //         final logisticform =
                  //             state.extra as TransportConfirmationForm?;

                  //         return MultiBlocProvider(
                  //           providers: [
                  //             BlocProvider(
                  //               create:
                  //                   (_) => bloc.transportersList()..request(''),
                  //             ),
                  //             BlocProvider(
                  //               create:
                  //                   (_) =>
                  //                       bloc.salesList()
                  //                         ..request(logisticform?.name ?? ''),
                  //             ),

                  //             BlocProvider(
                  //               create:
                  //                   (_) =>
                  //                       $sl.get<CreateLogisticCubit>()
                  //                         ..initDetails(logisticform),
                  //             ),
                  //             BlocProvider(
                  //               create:
                  //                   (_) =>
                  //                       $sl.get<CreateTransportCubit>()
                  //                         ..initDetails(form),
                  //             ),
                  //           ],
                  //           child: const NewTransportCnfm(),
                  //         );
                  //       },
                  //     ),
                  //   ],
                  // ),
                  // GoRoute(
                  //   path: _getPath(AppRoute.vehcileReporting),
                  //   builder: (ctxt, state) {
                  //     final filters = Pair(
                  //       StringUtils.docStatusVehicle('Draft'),
                  //       null,
                  //     );
                  //     return BlocProvider(
                  //       create:
                  //           (context) =>
                  //               VehicleBlocProvider.get().fetchVehicle()
                  //                 ..fetchInitial(filters),
                  //       child: const VehicleReportingList(),
                  //     );
                  //   },
                  //   routes: [
                  //     GoRoute(
                  //       path: _getPath(AppRoute.newVehiclereporting),
                  //       onExit: (context, state) async {
                  //         final form = state.extra as VehicleReportingForm?;
                  //         final formStatus =
                  //             form?.docstatus == 1 ? 'Submitted' : 'Reported';
                  //         return _promptConf(context, formStatus: formStatus);
                  //       },
                  //       builder: (_, state) {
                  //         final bloc = VehicleBlocProvider.get();
                  //         final blocprovider =
                  //             LogisticPlanningBlocProvider.get();
                  //         final form = state.extra;
                  //         return MultiBlocProvider(
                  //           providers: [
                  //             BlocProvider(
                  //               create:
                  //                   (_) =>
                  //                       $sl.get<CreateVehicleCubit>()
                  //                         ..initDetails(form),
                  //             ),
                  //             BlocProvider(
                  //               create:
                  //                   (_) =>
                  //                       blocprovider.transportersList()
                  //                         ..request(''),
                  //             ),
                  //             BlocProvider(
                  //               create: (_) => bloc.logisticList()..request(''),
                  //             ),
                  //           ],
                  //           child: const NewVehicleReporting(),
                  //         );
                  //       },
                  //     ),
                  //   ],
                  // ),
                  // GoRoute(
                  //   path: _getPath(AppRoute.loadingConfirmation),
                  //   builder: (ctxt, state) {
                  //     final filters = Pair(
                  //       StringUtils.docStatusVehicle('Reported'),
                  //       null,
                  //     );
                  //     return BlocProvider(
                  //       create:
                  //           (context) =>
                  //               LoadingCnfmBlocProvider.get()
                  //                   .fetchLoadingCnfmList()
                  //                 ..fetchInitial(filters),
                  //       child: const LoadingCnfrmList(),
                  //     );
                  //   },
                  //   routes: [
                  //     GoRoute(
                  //       path: _getPath(AppRoute.newLoadingConfirmation),
                  //       onExit: (context, state) async {
                  //         final form = state.extra as LoadingCnfmForm?;
                  //         final formStatus =
                  //             form?.docstatus == 1 ? 'Submitted' : 'Reported';
                  //         return _promptConf(context, formStatus: formStatus);
                  //       },
                  //       builder: (_, state) {
                  //         final blocprovider = LoadingCnfmBlocProvider.get();
                  //         final form = state.extra as LoadingCnfmForm;
                  //         // final forms = state.extra as LogisticModel;
                  //         $logger.devLog('.....$form');
                  //         return MultiBlocProvider(
                  //           providers: [
                  //             BlocProvider(
                  //               create:
                  //                   (_) => blocprovider.fetchLoadingCnfmList(),
                  //             ),
                  //             BlocProvider(
                  //               create: (_) => blocprovider.itemList(),
                  //             ),
                  //             BlocProvider(
                  //               create:
                  //                   (_) =>
                  //                       blocprovider.getItems()
                  //                         ..request(form.name ?? ''),
                  //             ),
                  //             BlocProvider(
                  //               create:
                  //                   (_) =>
                  //                       blocprovider.getLogisticList()
                  //                         ..request(form.name ?? ''),
                  //             ),
                  //             BlocProvider(
                  //               create:
                  //                   (_) =>
                  //                       $sl.get<CreateLoadingCnfmCubit>()
                  //                         ..initDetails(form),
                  //             ),
                  //           ],
                  //           child: const NewLoadingConfirmation(),
                  //         );
                  //       },
                  //     ),
                  //   ],
                  // ),
                  // GoRoute(
                  //   path: _getPath(AppRoute.proofOfDelivery),
                  //   builder: (ctxt, state) {
                  //     final form = state.extra as ProofOfDelivery?;

                  //     final filters = Pair(
                  //       StringUtils.docStatusInt('Draft'),
                  //       null,
                  //     );
                  //     return MultiBlocProvider(
                  //       providers: [
                  //         BlocProvider(
                  //           create:
                  //               (context) =>
                  //                   ProofOfDeliveryBlocProvider.get()
                  //                       .fetchProofOfDelivery()
                  //                     ..fetchInitial(filters),
                  //         ),

                  //         BlocProvider(
                  //           create:
                  //               (_) =>
                  //                   $sl.get<CreatePodCubit>()
                  //                     ..initDetails(form),
                  //         ),
                  //             BlocProvider<GeoPermissionHandler>(
                  //           create:
                  //               (_) =>
                  //                   GeoPermissionHandler()..checkPermission(),
                  //         ),

                  //         BlocProvider(
                  //           create:
                  //               (_) =>
                  //                   $sl.get<CreatePodCubit>()
                  //                     ..initDetails(form),
                  //         ),
                        
                  //       ],

                  //       child: const PodListScrn(),
                  //     );
                  //   },
                  //   routes: [
                  //     GoRoute(
                  //       path: _getPath(AppRoute.newproofOfDelivery),
                  //       onExit: (context, state) async {
                  //         final form = state.extra as ProofOfDelivery?;
                  //         final formStatus =
                  //             form?.docStatus == 1 ? 'Submitted' : 'Reported';
                  //         return _promptConf(context, formStatus: formStatus);
                  //       },
                  //       builder: (_, state) {
                  //         final blocprovider =
                  //             ProofOfDeliveryBlocProvider.get();
                  //         final form = state.extra as ProofOfDelivery?;
                  //         return MultiBlocProvider(
                  //           providers: [
                  //             BlocProvider(
                  //               create:
                  //                   (_) => blocprovider.fetchProofOfDelivery(),
                  //             ),
                  //             BlocProvider(
                  //               create:
                  //                   (_) =>
                  //                       blocprovider.salesInvoiceList()
                  //                         ..request(''),
                  //             ),

                  //             BlocProvider(
                  //               create:
                  //                   (_) =>
                  //                       $sl.get<LocationDistanceCubit>()
                  //                         ..getCurrentLocation(),
                  //             ),
                  //             BlocProvider(
                  //               create:
                  //                   (_) =>
                  //                       $sl.get<CreatePodCubit>()
                  //                         ..initDetails(form),
                  //             ),
                  //           ],
                  //           child: const NewPod(),
                  //         );
                  //       },
                  //     ),
                  //   ],
                  // ),
                  //     GoRoute(
                  //   path: _getPath(AppRoute.gateManagement),
                  //   builder: (ctxt, state) {
                  //     final filters = Pair(
                  //       StringUtils.docStatusInt('Draft'),
                  //       null,
                  //     );
                  //     return BlocProvider(
                  //       create:
                  //           (context) =>
                  //               GateManagementBlocProvider.get().fetchGateManagements()
                  //                 ..fetchInitial(filters),
                  //       child: const GateManagementList(),
                  //     );
                  //   },
                  //   routes: [
                  //     GoRoute(
                  //       path: _getPath(AppRoute.newGateManagement),
                  //       onExit: (context, state) async {
                  //         final form = state.extra as GateManagementForm?;
                  //         final formStatus =
                  //             form?.docStatus == 1 ? 'Submitted' : 'Draft';
                  //         return await _promptConf(
                  //           context,
                  //           formStatus: formStatus,
                  //         );
                  //       },
                  //       builder: (_, state) {
                  //         final gateEntryForm = state.extra as GateManagementForm?;
                  //         return MultiBlocProvider(
                  //           providers: [
                  //             // BlocProvider(
                  //             //   create:
                  //             //       (_) =>
                  //             //           GateEntryBlocProvider.get()
                  //             //               .purchaseOrderList()
                  //             //             ..request(''),
                  //             // ),
                  //             // BlocProvider(
                  //             //   create:
                  //             //       (_) =>
                  //             //           GateEntryBlocProvider.get()
                  //             //               .gateNumberList()
                  //             //             ..request(''),
                  //             // ),

                  //             BlocProvider(
                  //               create:
                  //                   (_) =>
                  //                       $sl.get<CreateGateManagementCubit>()
                  //                         ..initDetails(gateEntryForm),
                  //             ),

                  //             // BlocProvider(
                  //             //   create:
                  //             //       (_) =>
                  //             //           GateEntryBlocProvider.get()
                  //             //               .getPurchase()
                  //             //             ..request(gateEntryForm?.name ?? ''),
                  //             // ),
                  //           ],
                  //           child: const NewGateManagement(),
                  //         );
                  //       },
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ],
          ),
          // StatefulShellBranch(
          //   routes: [
          //     GoRoute(
          //       path: AppRoute.dashboard.path,
          //       redirect:
          //           (_, __) => dashboardStatus == 1 ? null : AppRoute.home.path,
          //       builder: (_, __) => const AppDashboardPage(),
          //     ),
          //   ],
          // ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoute.account.path,
                builder: (_, __) => const AppProfilePage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );

  // static Future<bool> _promptConf(
  //   BuildContext context, {
  //   required String formStatus,
  // }) async {
  //   final promptConf = shouldAskForConfirmation.value;
  //   if (!promptConf) return true;
  //   if (formStatus == 'Submitted' || formStatus == 'Pending From Transporter') {
  //     return true;
  //   }
  //   final result = await AppDialog.askForConfirmation<bool?>(
  //     context,
  //     title: 'Are you sure?',
  //     confirmBtnText: 'Yes',
  //     content: Messages.clearConfirmation,
  //     onTapConfirm: () => context.pop(true),
  //     onTapDismiss: () => context.pop(false),
  //   );
  //   return result ?? false;
  // }

  // static String _getPath(AppRoute route) => route.path.split('/').last;
}
