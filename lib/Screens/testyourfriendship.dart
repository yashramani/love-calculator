import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:love_count/commonWidget/homeScreenButton.dart';
import 'package:love_count/commonWidget/imageContainer.dart';
import 'package:love_count/commonWidget/textfeild.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class TestYourFriendShip extends StatefulWidget {
  const TestYourFriendShip({Key? key}) : super(key: key);

  @override
  _TestYourFriendShipState createState() => _TestYourFriendShipState();
}

class _TestYourFriendShipState extends State<TestYourFriendShip> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController yourname = TextEditingController();
  TextEditingController yourpartnername = TextEditingController();
  late String firstName, secondName;
  String percentage = '';
  late double pr = 0.0;

  validation() {
    if (_formKey.currentState!.validate()) {
      _calculate();
    } else {
      print('Getting Some Error');
    }
  }

  int sumCalc(String s)
  {
    int sum = 0;
    for(int i= 0; i<s.length;i++)
    {
      sum= sum+ s.codeUnitAt(i);
    }
    return sum;
  }

  void _calculate()
  {
    setState(() {
      if(yourname.text.isNotEmpty && yourpartnername.text.isNotEmpty)
      {
        firstName = yourname.text;
        secondName= yourpartnername.text;
        int sum1 = sumCalc(firstName);
        int sum2 = sumCalc(secondName);
        int totalSum = sum1 + sum2;
        totalSum = totalSum%10;
        totalSum= totalSum*10;
        percentage = totalSum.toString();
        pr = double.parse(percentage);
        yourname.clear();
        yourpartnername.clear();

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Stack(
        children: [
          ImageContainer(
            image: AssetImage('assets/images/friendship.jpg'),
          ),
          Container(
            padding: EdgeInsets.only(right: 20.0, left: 20.0),
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    const Text(
                      'Your Name',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    Gap(10),
                    CommonTextFormFeild(fontcolor: Colors.white,fontsize: 20,focuscolor: Colors.white,controller: yourname,borderColor: Colors.white,cursorcolor: Colors.white,hint: 'Your name',hinttextColor: Colors.white),
                    Gap(30),
                    const Text(
                      'Your friend\'s Name',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    Gap(10),
                    CommonTextFormFeild(fontcolor: Colors.white,fontsize: 20,focuscolor: Colors.white,controller: yourpartnername,borderColor: Colors.white,cursorcolor: Colors.white,hint: 'Enter your friend\'s  name',hinttextColor: Colors.white),
                    Gap(50),
                    SfLinearGauge(
                      animateRange: true,
                      ranges: [
                        LinearGaugeRange(
                          startValue: 0,
                          endValue: pr,
                        ),
                      ],
                      markerPointers: [
                        LinearShapePointer(
                          value: pr,
                        ),
                      ],
                      barPointers: [LinearBarPointer(value: 100)],
                    ),
                    Gap(50),
                    HomeScreenButton(context, () {
                      validation();
                    }, 'Check FriendShip', Colors.white, Colors.white),
                    Spacer(),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
