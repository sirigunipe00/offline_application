
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:offline_first/core/local_storage/local_keys.dart';
import 'package:offline_first/database_helper.dart';
import 'package:path/path.dart' as p;

import 'package:shared_preferences/shared_preferences.dart';

// class BackgroundSyncService {
// static Future<bool> syncPendingImages() async {
//   final prefs = await SharedPreferences.getInstance();
//   final db = DatabaseHelper.instance;

//   final apiKey = prefs.getString(LocalKeys.apiKey);
//   final apiSecret = prefs.getString(LocalKeys.apiSecret);

//   if (apiKey == null || apiSecret == null) return false;

//   final pendingImages = await db.getPendingImages();
//   if (pendingImages.isEmpty) return true;

//   final dio = Dio(BaseOptions(
//       baseUrl: 'https://shaktihormannuat.easycloud.co.in'));  

//   final authToken = 'token $apiKey:$apiSecret';

// for (var img in pendingImages) {
//   try {
//     final file = File(img['path']);
//     if (!file.existsSync()) continue;


//     final createResponse = await dio.post(
//       '/api/resource/Task',
//       data: {
//         'subject': img['subject'],
//         'description': img['description'],
//       },
//       options: Options(headers: {'Authorization': authToken}),
//     );

//     final taskName = createResponse.data['data']['name'];


//     FormData fileData = FormData.fromMap({
//       'doctype': 'Task',
//       'docname': taskName,
//       'is_private': '0',
//       'file': await MultipartFile.fromFile(
//         file.path,
//         filename: p.basename(file.path),
//       ),
//     });

//     await dio.post(
//       '/api/method/upload_file',
//       data: fileData,
//       options: Options(headers: {'Authorization': authToken}),
//     );


//     await file.delete();
//     await db.deleteImage(img['id']);

//   } catch (e) {
//     print('Sync failed: $e');
//     return false;
//   }
// }

//   return true;
// }
// }
class BackgroundSyncService {
  static Future<bool> syncPendingImages() async {
    final prefs = await SharedPreferences.getInstance();
    final db = DatabaseHelper.instance;
    final apiKey = prefs.getString(LocalKeys.apiKey);
    final apiSecret = prefs.getString(LocalKeys.apiSecret);

    if (apiKey == null || apiSecret == null) return false;

    final pendingImages = await db.getPendingImages();
    if (pendingImages.isEmpty) return true;


    Map<String, List<Map<String, dynamic>>> groupedImages = {};
    for (var img in pendingImages) {
      final batchId = img['batch_id'] as String;
      groupedImages.putIfAbsent(batchId, () => []).add(img);
    }

    final dio = Dio(BaseOptions(baseUrl: 'https://shaktihormannuat.easycloud.co.in'));
    final authToken = 'token $apiKey:$apiSecret';

    for (var batchId in groupedImages.keys) {
      final imagesInBatch = groupedImages[batchId]!;
      final firstRecord = imagesInBatch.first;

      try {

        final createResponse = await dio.post(
          '/api/resource/Task',
          data: {
            'subject': firstRecord['subject'],
            'description': firstRecord['description'],
          },
          options: Options(headers: {'Authorization': authToken}),
        );

        final taskName = createResponse.data['data']['name'];


        for (var img in imagesInBatch) {
          final file = File(img['path']);
          if (!file.existsSync()) continue;

          FormData fileData = FormData.fromMap({
            'doctype': 'Task',
            'docname': taskName,
            'is_private': '0',
            'file': await MultipartFile.fromFile(file.path, filename: p.basename(file.path)),
          });

          await dio.post(
            '/api/method/upload_file',
            data: fileData,
            options: Options(headers: {'Authorization': authToken}),
          );

          await file.delete();
          await db.deleteImage(img['id']);
        }
      } catch (e) {
        print('Sync failed for batch $batchId: $e');
        return false;
      }
    }
    return true;
  }
}