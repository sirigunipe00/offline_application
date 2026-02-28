import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';

@lazySingleton
class AppVersion {
  AppVersion(this.packageInfo);

  final PackageInfo packageInfo;

  Future<String> getAppVersion() async => packageInfo.version;
}