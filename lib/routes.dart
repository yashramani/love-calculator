import 'package:get/get.dart';
import 'package:love_count/Screens/checkpartnername.dart';
import 'package:love_count/Screens/homepage.dart';
import 'package:love_count/Screens/loveQuotes.dart';
import 'package:love_count/Screens/loveSticker.dart';
import 'package:love_count/Screens/matchBirthDate.dart';
import 'package:love_count/Screens/splashScreen.dart';
import 'package:love_count/Screens/testyourfriendship.dart';
import 'package:love_count/Screens/testyourlove.dart';

final route = [
  GetPage(name: '/', page: () => SplashScreen()),
  GetPage(name: '/homePage', page: () => HomePage()),
  GetPage(name: '/loveQuotes', page: () => LoveQuotes()),
  GetPage(name: '/matchBirthDate', page: () => MatchBirthDate()),
  GetPage(name: '/testyourlove', page: () => TestYourLove()),
  GetPage(name: '/testyourfriendship', page: () => TestYourFriendShip()),
  GetPage(name: '/checkpartnername', page: () => CheckPartnerName()),
  GetPage(name: '/loveSticker', page: () => LoveSticker()),
];

