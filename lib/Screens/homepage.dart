import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:love_count/commonWidget/homeScreenButton.dart';
import 'package:love_count/commonWidget/imageContainer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => AlertDialog(
          title: Text('Are you sure?'),
          content: Text('Do you want to exit the App'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text('No'),
        ),
        TextButton(
          onPressed: () => exit(0),
          child: Text('Yes'),
        ),
      ],
    ),
    )) ??
    false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              ImageContainer(image: AssetImage('assets/images/splashscreen.jpg')),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HomeScreenButton(context,(){
                      Get.toNamed('/checkpartnername');
                    },'Check Your Partner Name\'s 1st Charactor',Colors.white,Colors.white),

                    HomeScreenButton(context,(){
                      Get.toNamed('/testyourlove');
                    },'Test Your Love',Colors.white,Colors.white),
                    HomeScreenButton(context,(){
                      Get.toNamed('/testyourfriendship');
                    },'Test Your FriendShip',Colors.white,Colors.white),
                    HomeScreenButton(context,(){
                      Get.toNamed('/matchBirthDate');
                    },'Match BirthDate',Colors.white,Colors.white),
                    HomeScreenButton(context,(){
                      Get.toNamed('/loveQuotes');
                    },'Love Quotes',Colors.white,Colors.white),
                    // HomeScreenButton(context,(){
                    //   Get.toNamed('/loveSticker');
                    // },'Love Stickers',Colors.white,Colors.white),
                  ],
                ),
              ),
            ],
          ),
        )), onWillPop: _onWillPop,
    );
  }
}







