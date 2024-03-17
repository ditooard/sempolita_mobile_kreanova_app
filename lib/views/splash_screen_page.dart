import 'package:flutter/material.dart';
import 'package:sempolita_kreanova_app/shared/theme.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    // Use Future.delayed to wait for 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      // Navigate to the '/started' route
      Navigator.pushReplacementNamed(context, '/getStarted');
    });
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
