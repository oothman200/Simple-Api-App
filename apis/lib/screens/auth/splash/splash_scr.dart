import 'dart:async';

import 'package:apis/screens/post/posts_scr.dart';
import 'package:apis/screens/home/main-home_scr.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = '/SplashScreen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //
  void timerAndPush() {
    Timer(Duration(seconds: 2),
     () {
      Navigator.pushNamedAndRemoveUntil(
          context, MainHomeScreen.routeName, (route) => false);
    },
    );
  }

  //
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    timerAndPush();
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome Back',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            //
            SizedBox(height: 16),
            //
            Text(
              'Lets Go',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            //

            SizedBox(height: 68),
          ],
        ),
      ),
    );
  }
}
