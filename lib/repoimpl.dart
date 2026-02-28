import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:offline_first/core/local_storage/local_keys.dart';
import 'package:offline_first/database_helper.dart';
import 'package:path/path.dart' as p;
import 'package:shared_preferences/shared_preferences.dart';

class BackgroundSyncService {
  static Future<bool> syncPendingImages() async {
    final prefs = await SharedPreferences.getInstance();
    final db = DatabaseHelper.instance;

    final apiKey = prefs.getString(LocalKeys.apiKey);
    final apiSecret = prefs.getString(LocalKeys.apiSecret);

    if (apiKey == null || apiSecret == null) return false;


    final pendingImages = await db.getPendingImages();
    if (pendingImages.isEmpty) return true;

    final dio = Dio(BaseOptions(baseUrl: 'https://shaktihormannuat.easycloud.co.in'));
    final authToken = 'token $apiKey:$apiSecret';
    log('authToken: $authToken');

    for (var img in pendingImages) {
      try {
        final file = File(img['path']);
        if (!file.existsSync()) continue;

        FormData formData = FormData.fromMap({
          'file': await MultipartFile.fromFile(file.path, filename: p.basename(file.path)),
        });

        final response = await dio.post(
          '/api/method/upload_file',
          data: formData,
          options: Options(headers: {'Authorization': authToken}),
        );

        if (response.statusCode == 200) {
          await file.delete(); 
          await db.deleteImage(img['id']); 
        }
      } catch (e) {
        return false;
      }
    }
    return true;
  }
}