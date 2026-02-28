import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path/path.dart';

class AppIcons {
  static const basePath = 'assets';
  static const imagesPath = '$basePath/images';
  static const iconsPath = '$basePath/logo';
  


  static const shaktiHormannLogo = AppIcon('$iconsPath/hormann-logo-new-1 1.png');

  // static const bubbles = AppIcon('$imagesPath/bubbles.svg');

  static const gateeEntry = AppIcon('$imagesPath/gateentry.svg');
  static const gateExit = AppIcon('$imagesPath/gateexit.svg');
  static const logisticRequest = AppIcon('$imagesPath/Logistics-pana 1.svg');
  static const transportrterConfirmation = AppIcon(
    '$imagesPath/transportconfirmation.svg',
  );
  static const vehicleReporting = AppIcon('$imagesPath/vehiclereportings.svg');
  static const loadingConfirmation = AppIcon('$imagesPath/loadingconfirmation.svg');
  static const pod = AppIcon('$imagesPath/pod.svg');
  static const gatemanagement = AppIcon('$imagesPath/gatemanagement.png');
 

}

class AppIcon {
  const AppIcon(this.path);

  final String path;

  Widget toWidget({
    double width = 60,
    double height = 30,
    Color? color,
    BoxFit fit = BoxFit.contain,
  }) {
    final fileextension = extension(path);
    if (fileextension == '.svg') {
      return SvgPicture.asset(
        path,
        width: width,
        height: height,
        colorFilter:
            color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
        fit: fit,
      );
    }
    return Image.asset(
      path,
      width: width,
      height: height,
      color: color,
      fit: fit,
    );
  }
}
