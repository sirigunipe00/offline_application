import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:offline_first/database_helper.dart';
import 'package:offline_first/repoimpl.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:workmanager/workmanager.dart';

class OfflineImageApp extends StatefulWidget {
  const OfflineImageApp({super.key});

  @override
  State<OfflineImageApp> createState() => _OfflineImageAppState();
}

// class _OfflineImageAppState extends State<OfflineImageApp> {

//   final TextEditingController subjectController = TextEditingController();
//   final TextEditingController descriptionController = TextEditingController();

//   Future<void> _takePicture() async {

//     if(subjectController.text.isEmpty || descriptionController.text.isEmpty){
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Enter subject & description'))
//       );
//       return;
//     }

//     final ImagePicker picker = ImagePicker();
//     final XFile? photo = await picker.pickImage(source: ImageSource.camera);

//     if (photo != null) {

//       final directory = await getApplicationDocumentsDirectory();
//       final String fileName = p.basename(photo.path);
//       final String savedPath = '${directory.path}/$fileName';

//       await File(photo.path).copy(savedPath);

//       await DatabaseHelper.instance.insertImage(
//         savedPath,
//         subjectController.text,
//         descriptionController.text,
//       );
//       final result = await Connectivity().checkConnectivity();
//       if(result != ConnectivityResult.none){
//         await BackgroundSyncService.syncPendingImages();
//       } else{

//       Workmanager().registerOneOffTask(
//         'imageSync',
//         'syncImages',
//         constraints: Constraints(networkType: NetworkType.connected),
//       );

//     }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Offline Form')),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             TextField(
//               controller: subjectController,
//               decoration: const InputDecoration(labelText: 'Subject',
//               border: OutlineInputBorder()),

//             ),
//             const SizedBox(height: 10),
//             TextField(
//               controller: descriptionController,
//               decoration: const InputDecoration(
//                 labelText: 'Description',
//                 border: OutlineInputBorder(),
//                 ),
//               maxLines: 3,
//             ),
//           ],

//         )
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _takePicture,
//         child: const Icon(Icons.camera_alt),
//       ),
//     );
//   }

// }
class _OfflineImageAppState extends State<OfflineImageApp> {
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final List<XFile> _capturedImages = [];

  Future<void> _takePicture() async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    if (photo != null) {
      setState(() {
        _capturedImages.add(photo);
      });
    }
  }

  Future<void> _saveBatchToDatabase() async {
    if (subjectController.text.isEmpty || _capturedImages.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Add subject and at least one image')));
      return;
    }

    final String batchId = DateTime.now().millisecondsSinceEpoch.toString();
    final directory = await getApplicationDocumentsDirectory();

    for (var photo in _capturedImages) {
      final String fileName = p.basename(photo.path);
      final String savedPath = '${directory.path}/$fileName';
      await File(photo.path).copy(savedPath);

      await DatabaseHelper.instance.insertImage(
        savedPath,
        subjectController.text,
        descriptionController.text,
        batchId,
      );
    }

    setState(() {
      _capturedImages.clear();
      subjectController.clear();
      descriptionController.clear();
    });

    final result = await Connectivity().checkConnectivity();
    if (result != ConnectivityResult.none) {
      await BackgroundSyncService.syncPendingImages();
    } else {
      Workmanager().registerOneOffTask('imageSync', 'syncImages',
          constraints: Constraints(networkType: NetworkType.connected));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Offline Form')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                    controller: subjectController,
                    decoration: const InputDecoration(
                        labelText: 'Subject', border: OutlineInputBorder())),
                const SizedBox(height: 10),
                TextField(
                    controller: descriptionController,
                    decoration: const InputDecoration(
                        labelText: 'Description', border: OutlineInputBorder()),
                    maxLines: 2),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: _saveBatchToDatabase,
                  icon: const Icon(Icons.cloud_upload),
                  label: const Text('CREATE'),
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50)),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: _takePicture, child: const Icon(Icons.camera_alt)),
    );
  }
}
