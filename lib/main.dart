import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:offline_first/offline_image.dart';
import 'package:offline_first/workmanager.dart';
import 'package:workmanager/workmanager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Workmanager().initialize(
    callbackDispatcher,
    isInDebugMode: false,
  );
  await Workmanager().registerPeriodicTask(
  "periodicSync",
  "syncImages",
  frequency: const Duration(minutes: 15),
  existingWorkPolicy: ExistingPeriodicWorkPolicy.keep,
  constraints: Constraints(
    networkType: NetworkType.connected,
  ),
);
// Workmanager().registerOneOffTask(
//         "sync-task-${DateTime.now().millisecondsSinceEpoch}",
//         "syncImages",
//         constraints: Constraints(
//           networkType: NetworkType.connected,
//         ),
//       );
  // // 🔥 ADD THIS
  // await Workmanager().registerPeriodicTask(
  //   "periodicSync",
  //   "syncImages",
  //   frequency: const Duration(minutes: 15),
  //   constraints: Constraints(
  //     networkType: NetworkType.connected,
  //   ),
  // );
//   Connectivity().onConnectivityChanged.listen((result) {
//   if (result != ConnectivityResult.none) {
//     log("🌐 Internet Connected");
//   } else {
//     log("🔴 No Internet Connection");
//   }
// });
// Connectivity().onConnectivityChanged.listen((result) {
//   if (result != ConnectivityResult.none) {
//     log("🌐 Internet Connected");

//     Workmanager().registerOneOffTask(
//       "imageSync",
//       "syncImages",
//       existingWorkPolicy: ExistingWorkPolicy.keep,
//       constraints: Constraints(
//         networkType: NetworkType.connected,
//       ),
//     );
//   }
// });
final result = await Connectivity().checkConnectivity();
  if (result != ConnectivityResult.none) {
    Workmanager().registerOneOffTask(
      "imageSync",
      "syncImages",
      existingWorkPolicy: ExistingWorkPolicy.keep,
      constraints: Constraints(
        networkType: NetworkType.connected,
      ),
    );
  }

  // Listen for internet changes
  Connectivity().onConnectivityChanged.listen((result) {
    if (result != ConnectivityResult.none) {
      log("🌐 Internet Connected");

      Workmanager().registerOneOffTask(
        "imageSync",
        "syncImages",
        existingWorkPolicy: ExistingWorkPolicy.keep,
        constraints: Constraints(
          networkType: NetworkType.connected,
        ),
      );
    }

  });

  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: OfflineImageApp(),
  ));
}