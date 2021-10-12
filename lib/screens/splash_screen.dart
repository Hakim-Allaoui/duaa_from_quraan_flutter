import 'dart:async';

import 'package:audio/utils/my_navigator.dart';
import 'package:audio/utils/my_theme.dart';
import 'package:audio/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 5), () {
      MyNavigator.goHome(context);
    });
  }


  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(
        [/*SystemUiOverlay.top,SystemUiOverlay.bottom*/]);
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset(
                          'assets/icon.png',
                          width: 200.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Tools.packageInfo.appName == null ? SizedBox() : Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            Tools.packageInfo.appName,
                            style: TextStyle(
                                color: MyColors.vintageReport[2],
                                fontWeight: FontWeight.w900,
                                fontSize: 30.0),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    SizedBox(height: 30.0),
                    Text(
                      'تحميل...',
                      softWrap: true,
                      textAlign: TextAlign.center
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
