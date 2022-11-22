import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hadeth_app/screens/home_screen.dart';

import 'package:hadeth_app/utils/color_app.dart';
import 'package:hadeth_app/utils/text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: ((context) => HomeScreen())));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorApp.green1,
      body: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(
            "assets/svg/splash.svg",
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/svg/islamic.svg",
                  height: 90,
                  width: 90,
                ),
                SizedBox(
                  height: 7,
                ),
                TextApp.splashScreen,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
