import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:workmanager/workmanager.dart';
import 'package:path/path.dart' as p;
import 'package:offline_first/database_helper.dart';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    WidgetsFlutterBinding.ensureInitialized();

    log("🔵 Workmanager Triggered");
    log("🟢 Task Name: $task");

    final pendingImages =
        await DatabaseHelper.instance.getPendingImages();

    log("📂 Pending Images Count: ${pendingImages.length}");

    if (pendingImages.isEmpty) {
      log("✅ No images to sync");
      return Future.value(true);
    }

    final dio = Dio(BaseOptions(
      baseUrl: "https://shaktihormannuat.easycloud.co.in",
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ));

 for (var img in pendingImages) {
  try {
    String filePath = img['path'];
    String fileName = p.basename(filePath);

    log("📤 Uploading: $fileName");

    if (!File(filePath).existsSync()) {
      log("❌ File not found: $filePath");
      continue;
    }

    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(
        filePath,
        filename: fileName,
      ),
      "is_private": "0",
    });
log('formData: $formData');
    final response = await dio.post(
      "/api/method/upload_file",
      data: formData,
      options: Options(
        headers: {
          "Authorization": "token 26d8985eb685fc8:2a49921a0facc96",
          "Accept": "application/json",
        },
      ),
    );

    log("🌐 Status: ${response.statusCode}");
    log("🌐 Response: ${response.data}");

    if (response.statusCode == 200) {

  log("✅ Synced: $fileName");


  try {
    await File(filePath).delete();
    log("🗑 Local file deleted");
  } catch (e) {
    log("⚠ Could not delete file: $e");
  }


  await DatabaseHelper.instance.deleteImage(img['id']);
  log("🗂 DB record deleted");
}

  } catch (e) {
    log("❌ Upload Failed: $e");
    return Future.value(false); 
  }
}

    log("🎉 Sync Completed");
    return Future.value(true);
  });
}