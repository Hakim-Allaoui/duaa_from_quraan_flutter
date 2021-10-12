import 'package:flutter/material.dart';

class MyNavigator{
  static void goHome(BuildContext context){
    Navigator.pushReplacementNamed(context, "/home");
  }

  static void goPrivacy(BuildContext context) {
    Navigator.pushNamed(context, '/privacy');
  }
}