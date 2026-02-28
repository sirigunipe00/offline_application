import 'package:flutter/material.dart';
import 'package:offline_first/repoimpl.dart';
import 'package:workmanager/workmanager.dart';


@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    WidgetsFlutterBinding.ensureInitialized();

    return await BackgroundSyncService.syncPendingImages();
  });
}