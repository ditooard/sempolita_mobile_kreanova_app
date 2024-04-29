import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sempolita_kreanova_app/shared/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool _isDisposed = false;

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () {
      if (!_isDisposed) {
        checkAuthentication();
      }
    });
  }

  void dispose() {
    _isDisposed = true; // _isDisposed menjadi true saat widget di-"dispose"
    super.dispose();
  }

  Future<void> checkAuthentication() async {
    if (_isDisposed) return; // Periksa kembali apakah widget sudah di-"dispose"

    final prefs = await SharedPreferences.getInstance();
    final savedToken = prefs.getString('token');

    if (savedToken != null && savedToken.isNotEmpty) {
      Navigator.pushReplacementNamed(context, '/landingPage');
    } else {
      Navigator.pushReplacementNamed(context, '/register');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greenColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 172,
                height: 168,
              )
            ],
          ),
        ),
      ),
    );
  }
}
