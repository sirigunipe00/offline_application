import 'dart:developer';
import 'package:offline_first/database_helper.dart';
import 'package:offline_first/repo.dart';



class Repoimpl implements Repo {
  const Repoimpl();

  @override
  Future<void> saveImage(String path) async {

    await DatabaseHelper.instance.insertImage(path);
    

    // Workmanager().registerOneOffTask(
    //   "sync_${DateTime.now().millisecondsSinceEpoch}",
    //   "uploadImageTask",
    //   constraints: Constraints(
    //     networkType: NetworkType.connected, 
    //   ),
    // );
    
    log("Image queued for background sync: $path");
  }
}