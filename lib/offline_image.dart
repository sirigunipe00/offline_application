import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:offline_first/database_helper.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:workmanager/workmanager.dart';



class OfflineImageApp extends StatelessWidget {
  const OfflineImageApp({super.key});

 Future<void> _takePicture() async {
  final ImagePicker picker = ImagePicker();
  final XFile? photo = await picker.pickImage(source: ImageSource.camera);

  if (photo != null) {

    final directory = await getApplicationDocumentsDirectory();
    final String fileName = p.basename(photo.path);
    final String savedPath = '${directory.path}/$fileName';


    await File(photo.path).copy(savedPath);


    await DatabaseHelper.instance.insertImage(savedPath);
    //  final result = await Connectivity().checkConnectivity();

    // if (result != ConnectivityResult.none) {
    //   log("🌐 Internet available → Triggering upload");

    //   Workmanager().registerOneOffTask(
    //     "imageSync",
    //     "syncImages",
    //     existingWorkPolicy: ExistingWorkPolicy.keep,
    //     constraints: Constraints(
    //       networkType: NetworkType.connected,
    //     ),
    //   );
    // } else {
    //   log("🔴 Offline → Will sync when internet returns");
    // }
  
 


      Workmanager().registerOneOffTask(
        "sync-task-${DateTime.now().millisecondsSinceEpoch}",
        "syncImages",
        constraints: Constraints(
          networkType: NetworkType.connected,
        ),
      );
         log("Temporary Path: ${photo.path}");

    

      log("Image saved locally. Sync scheduled when online.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Offline Image Sync")),
      body: const Center(child: Text("Take a photo while offline.")),
      floatingActionButton: FloatingActionButton(
        onPressed: _takePicture,
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}