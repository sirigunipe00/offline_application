// import 'dart:async';
// import 'dart:io';

// import 'package:device_info_plus/device_info_plus.dart';

// import 'package:package_info_plus/package_info_plus.dart';


// mixin DeviceInfoMixin {
//   Future<UserDeviceInfo> getDeviceInfo() async {
//     DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
//     AndroidDeviceInfo? androidInfo;
//     IosDeviceInfo? iosInfo;
//     PackageInfo platform = await PackageInfo.fromPlatform();

//     if (Platform.isAndroid) {
//       androidInfo = await deviceInfo.androidInfo;
//     } else if (Platform.isIOS) {
//       iosInfo = await deviceInfo.iosInfo;
//     }

//     String deviceType = _getDeviceType();
//     String osName = _getOsName(androidInfo, iosInfo);
//     String uniqueId = _getUniqueId(androidInfo, iosInfo);
//     String appVersion = platform.version;
//     String osDetails = _getOsDetails(androidInfo, iosInfo);
//     // final subsId = OneSignal.User.pushSubscription.id;

//     return UserDeviceInfo(
//       deviceType: deviceType,
//       osName: osName,
//       deviceUniqueId: uniqueId,
//       installedAppVersion: appVersion,
//       latestAppVersion: appVersion,
//       pushNotificationDeviceId: '',
//       osDetails: osDetails,
//       description: 'Updated on ${DateTime.now()}',
//     );
//   }

//   String _getDeviceType() => Platform.isAndroid ? 'Android' : 'iOS';

//   String _getOsDetails(AndroidDeviceInfo? androidInfo, IosDeviceInfo? iosInfo) {
//     return Platform.isAndroid
//         ? androidInfo == null
//             ? ''
//             : '${androidInfo.model} - ${androidInfo.manufacturer} - ${androidInfo.version.sdkInt} - ${androidInfo.version.codename}'
//         : iosInfo == null
//             ? ''
//             : '${iosInfo.name} - ${iosInfo.systemName} - ${iosInfo.systemVersion} - ${iosInfo.model} - ${iosInfo.utsname.version}';
//   }

//   String _getUniqueId(AndroidDeviceInfo? androidInfo, IosDeviceInfo? iosInfo) {
//     return Platform.isAndroid
//         ? androidInfo?.id ?? ''
//         : iosInfo?.identifierForVendor ?? iosInfo?.utsname.version ?? '';
//   }

//   String _getOsName(AndroidDeviceInfo? androidInfo, IosDeviceInfo? iosInfo) {
//     return Platform.isAndroid
//         ? androidInfo?.version.sdkInt.toString() ?? ''
//         : iosInfo?.systemVersion ??
//             iosInfo?.utsname.machine ??
//             iosInfo.toString();
//   }
// }
