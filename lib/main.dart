import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:sempolita_kreanova_app/shared/theme.dart';
import 'package:sempolita_kreanova_app/views/dashboard/information_page.dart';
import 'package:sempolita_kreanova_app/views/dashboard/iot/detail_iot_page.dart';
import 'package:sempolita_kreanova_app/views/dashboard/iot/iot_page.dart';
import 'package:sempolita_kreanova_app/views/dashboard/landing_page.dart';
import 'package:sempolita_kreanova_app/views/dashboard/profile/change_pass_page.dart';
import 'package:sempolita_kreanova_app/views/dashboard/profile/detail_profile.dart';
import 'package:sempolita_kreanova_app/views/dashboard/profile/profile_page.dart';
import 'package:sempolita_kreanova_app/views/forget_pass_page.dart';
import 'package:sempolita_kreanova_app/views/get_started_page.dart';
import 'package:sempolita_kreanova_app/views/login_page.dart';
import 'package:sempolita_kreanova_app/views/register_page.dart';
import 'package:sempolita_kreanova_app/views/splash_screen_page.dart';
import 'package:sempolita_kreanova_app/views/term_condition_page.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  debugPaintSizeEnabled = false;
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: greenColor, // Warna status bar
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sistem Monitoring Balita',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Poppins',
          primaryColor: MaterialColor(0xff31C48D, {
            50: Color(0xff31C48D),
            100: Color(0xff31C48D),
            200: Color(0xff31C48D),
            300: Color(0xff31C48D),
            400: Color(0xff31C48D),
            500: Color(0xff31C48D),
            600: Color(0xff31C48D),
            700: Color(0xff31C48D),
            800: Color(0xff31C48D),
            900: Color(0xff31C48D),
            1000: Color(0xff31C48D),
          })),
      home: SplashPage(),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashPage(),
        '/getStarted': (context) => GetStarted(),
        '/register': (context) => RegisterPage(),
        '/termsConditions': (context) => TermsConditions(),
        '/login': (context) => LoginPage(),
        '/forgetpass': (context) => LupaPassword(),
        '/profile': (context) => ProfilePage(),
        '/detailProfile': (context) => DetailProfile(),
        '/ubahPass': (context) => UbahPassword(),
        '/detailIot': (context) => DetailIot(),
        '/iotPage': (context) => IotPage(),
        '/informationPage': (context) => InformationPage(),
        '/landingPage': (context) => LandingPage(),
      },
    );
  }
}
