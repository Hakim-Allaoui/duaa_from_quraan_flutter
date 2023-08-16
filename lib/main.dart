import 'package:audio/screens/home_screen.dart';
import 'package:audio/screens/privacy.dart';
import 'package:audio/screens/splash_screen.dart';
import 'package:audio/utils/ads_helper.dart';
import 'package:audio/utils/audio_helper.dart';
import 'package:audio/utils/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:audio/utils/tools.dart';

var routes = <String, WidgetBuilder>{
  "/home": (BuildContext context) => Home(),
  "/privacy": (BuildContext context) => Privacy(),
};

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AdsHelper.initFacebookAds();
  //AdsHelper.initAdmobAds();
  Tools.getAppInfo().then((value) {
    AudioHelper.fillAudio();
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Locale("ar"),
      title: 'أدعية القرآن الكريم',
      theme: ThemeData(
        primaryColor: MyColors.vintageReport[0],
        fontFamily: 'Cairo',
        textTheme: TextTheme(
          bodyMedium: TextStyle(
              fontSize: 16,
              color: MyColors.vintageReport[2],
              fontWeight: FontWeight.w600),
          titleLarge: TextStyle(
            fontSize: 18,
            color: MyColors.vintageReport[2],
            fontWeight: FontWeight.w900,
          ),
        ),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(secondary: MyColors.vintageReport[1]),
      ),
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: SplashScreen(),
      ),
      routes: routes,
    );
  }
}
