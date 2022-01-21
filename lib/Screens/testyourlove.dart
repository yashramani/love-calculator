import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:love_count/commonWidget/homeScreenButton.dart';
import 'package:love_count/commonWidget/imageContainer.dart';
import 'package:love_count/commonWidget/textfeild.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class TestYourLove extends StatefulWidget {
  const TestYourLove({Key? key}) : super(key: key);

  @override
  _TestYourLoveState createState() => _TestYourLoveState();
}

class _TestYourLoveState extends State<TestYourLove> {

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
        children: [ //lovesticker
          ImageContainer(
            image: AssetImage('assets/images/lovesticker.jpg'),
          ),
          Container(
            padding: EdgeInsets.only(right: 20.0, left: 20.0),
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Gap(20),
                    const Text(
                      'Your Name',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    Gap(10),
                    CommonTextFormFeild(fontcolor: Colors.white,fontsize: 20,focuscolor: Colors.white,controller: yourname,borderColor: Colors.white,cursorcolor: Colors.white,hint: 'Your name',hinttextColor: Colors.white),
                    Gap(30),
                    const Text(
                      'Your crush\'s Name',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    Gap(10),
                    CommonTextFormFeild(fontcolor: Colors.white,fontsize: 20,focuscolor: Colors.white,controller: yourpartnername,borderColor: Colors.white,cursorcolor: Colors.white,hint: 'Enter your crush\'s  name',hinttextColor: Colors.white),
                    Gap(30),
                    SfRadialGauge(enableLoadingAnimation: true, axes: <RadialAxis>[
                      RadialAxis(minimum: 0, maximum: 100,numberFormat: NumberFormat.compact(),ranges: <GaugeRange>[
                        GaugeRange(startValue: 0, endValue: 33, color: Colors.red),
                        GaugeRange(startValue: 33, endValue: 66, color: Colors.blue),
                        GaugeRange(startValue: 66, endValue: 100, color: Colors.red),
                      ],pointers: <GaugePointer>[
                        NeedlePointer(value: percentage == null
                            ? 0.0
                            : pr,
                          enableAnimation: true,needleColor: Colors.white,tailStyle: TailStyle(color: Colors.white),)
                      ], annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                            widget: Container(
                                child: Text(pr.toString() + '%',
                                    style: TextStyle(
                                        fontSize: 40, color: Colors.white,fontWeight: FontWeight.bold))),
                            angle: 90,
                            positionFactor: 0.5)
                      ])
                    ]),
                    Gap(30),
                    HomeScreenButton(context, () {
                      validation();
                    }, 'Click Here', Colors.white, Colors.white),
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


