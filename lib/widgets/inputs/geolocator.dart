// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';

// Future<Position?> determinePositionWithAlert(BuildContext context) async {
//   bool serviceEnabled;
//   LocationPermission permission;

//   // ✅ Check if GPS is enabled
//   serviceEnabled = await Geolocator.isLocationServiceEnabled();
//   if (!serviceEnabled) {
//     _showLocationDialog(
//       context,
//       title: 'Location Disabled',
//       message: 'Please enable Location/GPS to continue.',
//       buttonText: 'Open Settings',
//       onTap: () => Geolocator.openLocationSettings(),
//     );
//     return null;
//   }

//   // ✅ Check permissions
//   permission = await Geolocator.checkPermission();
//   if (permission == LocationPermission.denied) {
//     permission = await Geolocator.requestPermission();
//     if (permission == LocationPermission.denied) {
//       _showLocationDialog(
//         context,
//         title: 'Permission Required',
//         message: 'This feature needs location permission to continue.',
//         buttonText: 'Allow Permission',
//         onTap: () => Geolocator.requestPermission(),
//       );
//       return null;
//     }
//   }

//   // ✅ Permanently denied
//   if (permission == LocationPermission.deniedForever) {
//     _showLocationDialog(
//       context,
//       title: 'Permission Permanently Denied',
//       message: 'Please enable it from App Settings.',
//       buttonText: 'Open App Settings',
//       onTap: () => Geolocator.openAppSettings(),
//     );
//     return null;
//   }

//   // ✅ Get location
//   return await Geolocator.getCurrentPosition(
//     desiredAccuracy: LocationAccuracy.high,
//   );
// }

// void _showLocationDialog(
//   BuildContext context, {
//   required String title,
//   required String message,
//   required String buttonText,
//   required VoidCallback onTap,
// }) {
//   showDialog(
//     context: context,
//     barrierDismissible: false,
//     builder: (dialogContext) {
//       return AlertDialog(
//         title: Text(title),
//         content: Text(message),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.of(dialogContext, rootNavigator: true).pop(); // ✅ safe close
//               onTap();
//             },
//             child: Text(buttonText),
//           ),
//           TextButton(
//             onPressed: () =>
//                 Navigator.of(dialogContext, rootNavigator: true).pop(), // ✅ uses dialogContext
//             child: const Text('Cancel'),
//           ),
//         ],
//       );
//     },
//   );
// }
