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
   double pr = 0.0;

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
      body: Container(
        height: MediaQuery.of(context).size.height-MediaQuery.of(context).viewInsets.bottom,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/friendship.jpg'),fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(right: 20.0, left: 20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Gap(50),
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
                      SfRadialGauge(
                          axes: <RadialAxis>[
                            RadialAxis(minimum: 0,
                                maximum: 100,
                                startAngle: 270,
                                endAngle: 270,
                                showLabels: true,
                                showTicks: true,
                                radiusFactor: 0.6,
                                axisLineStyle: AxisLineStyle(
                                    cornerStyle: CornerStyle.bothFlat,
                                    color: Colors.black12,
                                    thickness: 12),
                                pointers: <GaugePointer>[
                                  RangePointer(
                                    value: pr,
                                    cornerStyle: CornerStyle.bothFlat,
                                    width: 12,
                                    sizeUnit: GaugeSizeUnit.logicalPixel,
                                    color: Colors.grey,
                                  ),

                                  MarkerPointer(
                                      value: pr,
                                      enableDragging: true,
                                      enableAnimation: true,
                                      markerHeight: 20,
                                      markerWidth: 20,
                                      markerType: MarkerType.diamond,
                                      color: Colors.white,
                                      borderWidth: 2,
                                      borderColor: Colors.white54)
                                ],
                                annotations: <GaugeAnnotation>[
                                  GaugeAnnotation(
                                      angle: 90,
                                      axisValue: 5,
                                      positionFactor: 0.1,
                                      widget: Text(pr
                                          .toString() + '%',
                                          style: TextStyle(
                                              fontSize: 50,
                                              fontWeight: FontWeight
                                                  .bold,
                                              color: Colors.white))
                                  )
                                ]
                            )
                          ]
                      ),
                      HomeScreenButton(context, () {
                        validation();
                      }, 'Check FriendShip', Colors.white, Colors.white),
                      Gap(50),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
