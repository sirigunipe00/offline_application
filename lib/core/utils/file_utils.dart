import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:offline_first/core/core.dart';
import 'package:path_provider/path_provider.dart' as syspath;



mixin FileUtilsMixin {
  Future<String?> getFilePath(String fileName,
      {String folder = 'm11_ind'}) async {
    try {
      final appDocDir = await syspath.getApplicationDocumentsDirectory();
      final String filePath = path.join(appDocDir.path, folder, fileName);
      final File file = File(filePath);
      if (file.existsSync() && (await file.length()) > 0) {
        return file.path;
      }
    } on Exception catch (e, st) {
      $logger.error(e.toString(), e, st);
    }

    return null;
  }

  Future<File?> saveFile(String fileNameWithExt, String data) async {
    if (data.doesNotHaveValue) {
      return null;
    }

    final appDir = await syspath.getApplicationDocumentsDirectory();
    final directory = Directory(path.join(appDir.path, fileNameWithExt));
    if (!directory.existsSync()) {
      await directory.create();
    }
    final newPath = path.join(directory.path, fileNameWithExt);
    final file = File(newPath);

    if (!file.existsSync()) {
      file.createSync();
    }

    if (file.existsSync()) {
      final bytes = base64.decode(data);
      return await file.writeAsBytes(bytes);
    }
    return null;
  }
}


class FileUtils {
  static File? toFile(String? base64File) {
    if(base64File.doesNotHaveValue) return null;

    final unit8list = base64Decode(base64File!);
    return File.fromRawPath(unit8list);
  }
}