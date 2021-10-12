import 'package:audio/utils/strings.dart';
import 'package:package_info/package_info.dart';
import 'package:url_launcher/url_launcher.dart';

class Tools{
  static PackageInfo packageInfo = PackageInfo(
    appName: ' ',
    packageName: ' ',
    version: ' ',
    buildNumber: ' ',
  );

  static Future<void> getAppInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
      packageInfo = info;
  }

  static launchURLRate() async {
    var url = 'https://play.google.com/store/apps/details?id=' +
        Tools.packageInfo.packageName;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static launchURLMore() async {
    var url = 'https://play.google.com/store/apps/developer?id=' +
        Strings.store.split(' ').join(('+'));
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}