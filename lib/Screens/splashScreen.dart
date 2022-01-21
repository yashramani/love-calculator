import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:love_count/commonWidget/imageContainer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void initState() {
    Timer(Duration(seconds: 5),()=> Get.toNamed('/homePage'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Column(
      children: [
        Spacer(),
        Lottie.asset('assets/animations/splash.json'),
        Spacer(),
        Text('Love  ❤  Calculator',style: TextStyle(fontSize: 30),),
        Spacer(),
      ],
    )),);
  }
}
