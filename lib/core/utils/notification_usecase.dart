// import 'package:injectable/injectable.dart';
// import 'package:offline_first/core/utils/device_info_mixin.dart';
// import 'package:offline_first/features/push_notifications.dart/data/notification_repo.dart';

// @lazySingleton
// class NotificationUsecase with DeviceInfoMixin {
//   const NotificationUsecase({required this.repo});

//   final NotificationRepo repo;

//   void updateOSDetails() async {
//     final info = await getDeviceInfo();



//     // Avoid logging full device info which may contain identifiers.
//     await repo.updateDeviceInfo(info);
//   }
// }
