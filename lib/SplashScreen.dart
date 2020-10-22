import 'dart:async';
import 'package:flutter/material.dart';

import 'Pages/Auth/Login_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

/// Component UI
class _SplashScreenState extends State<SplashScreen> {
  /// Setting duration in splash screen
  startTime() async {
    return new Timer(Duration(seconds: 9), navigatorPage);
  }

  void navigatorPage() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    generateDeviceToken();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xffA61B4D),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/Splash.png'), fit: BoxFit.cover),
          ),
          child: Container(
            child: Center(
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 30.0),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
