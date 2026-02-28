
import 'package:flutter/material.dart';
import 'package:offline_first/core/core.dart';
import 'package:offline_first/widgets/buttons/app_btn.dart';
import 'package:url_launcher/url_launcher.dart';


class AppUpdateDialog extends StatelessWidget {
  const AppUpdateDialog({
    required this.appName,
    required this.packageName,
    super.key,
  });

  final String appName;
  final String packageName;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: AlertDialog(
        title: const Text('App Update Required', textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'New version of $appName is available in Play Store. Please update the app to continue.',
              textAlign: TextAlign.center,
              style: context.textTheme.titleMedium,
            ),
            const Row(
              children: [
               
              ],
            ),
          ],
        ),
        actions: [
          AppButton(
            width: 500,
            label: 'Open PlayStore',
            onPressed: () => launchPlayStore(packageName),
          ),
        ],
      ),
    );
  }

  void launchPlayStore(String appId) async {
    var url =
        Uri.parse('https://play.google.com/store/apps/details?id=$appId&hl=en');
    
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
}
