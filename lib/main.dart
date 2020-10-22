import 'package:celebration/SplashScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Component/Colors.dart';
import 'Pages/Auth/Login_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
void main() {
  runApp(
      MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            DefaultCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            Locale("ar", "AE"),
          ],
          locale: Locale("ar", "AE"),
          theme: ThemeData(
              primaryColor: Colors.deepPurple,
              errorColor: Colors.red,
              primarySwatch: AppColors.YellowColor,
              fontFamily: "Roboto",
              accentColor: Colors.white
          ),
          home:SplashScreen()));

}

