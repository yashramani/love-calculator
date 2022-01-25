import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:intl/intl.dart';
import 'package:odometer/odometer.dart';
import 'package:love_count/commonWidget/homeScreenButton.dart';
import 'package:love_count/commonWidget/imageContainer.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';


class MatchBirthDate extends StatefulWidget {
  const MatchBirthDate({Key? key}) : super(key: key);

  @override
  _MatchBirthDateState createState() => _MatchBirthDateState();
}

class _MatchBirthDateState extends State<MatchBirthDate>{

   String? yourbdateformat;
   String? partnerbdateformat;
   late String firstName, secondName;
   String percentage = '';
   DateTime currentDate = DateTime.now();
    double match = 0;

   validation(){
     if(yourbdateformat == null || partnerbdateformat == null){
       Get.snackbar(
         "WARNING!!",
         "Please Select Birthdate",
         colorText: Colors.black,
         backgroundColor: Colors.white,
         snackPosition: SnackPosition.BOTTOM,
       );
     }
     else{
       _calculate();
       print('Next Step............................${currentDate.toString()}');
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
       if(yourbdateformat != null || partnerbdateformat != null)
       {
         firstName = yourbdateformat.toString();
         secondName= partnerbdateformat.toString();
         int sum1 = sumCalc(firstName);
         int sum2 = sumCalc(secondName);
         int totalSum = sum1 + sum2;
         totalSum = totalSum%10;
         totalSum= totalSum*10;
         percentage = totalSum.toString();
         match = double.parse(percentage);
        print('------------------------------- $percentage');
        print('------------------------------- ${match.runtimeType}');
       }
     });
   }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Stack(
        children: [
          const ImageContainer(image: AssetImage('assets/images/bg.jpg')),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HomeScreenButton(context,() async {
                  {
                    final DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: currentDate,
                        firstDate: DateTime(1955),
                        lastDate: DateTime(2050));
                    if (pickedDate != null && pickedDate != currentDate)
                      setState(() {
                        currentDate = pickedDate;
                      });
                  }
                      yourbdateformat = DateFormat('yyyy-MM-dd').format(currentDate);
                },yourbdateformat == null?'Select Your Birthdate' : yourbdateformat.toString(),Colors.white,Colors.white),
                const Gap(10.0,),
                HomeScreenButton(context,()async {
                  {
                    final DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: currentDate,
                        firstDate: DateTime(1955),
                        lastDate: DateTime(2050));
                    if (pickedDate != null && pickedDate != currentDate)
                      setState(() {
                        currentDate = pickedDate;
                      });
                  }
                  partnerbdateformat = DateFormat('yyyy-MM-dd').format(currentDate);
                },partnerbdateformat == null?'Select Your partner Birthdate':partnerbdateformat.toString(),Colors.white,Colors.white),
                SfRadialGauge(
                    axes: <RadialAxis>[
                      RadialAxis(minimum: 0,
                        maximum: 100,
                        startAngle: 270,
                        endAngle: 270,
                        showLabels: true,
                        showTicks: true,
                        radiusFactor: 0.6,
                        labelOffset: -20,
                        tickOffset: -10,
                        axisLineStyle: const AxisLineStyle(
                            cornerStyle: CornerStyle.bothCurve,
                            color: Colors.black,
                            thickness: 3),
                        pointers: <GaugePointer>[
                          RangePointer(
                            value: match,
                            cornerStyle: CornerStyle.bothFlat,
                            width: 3,
                            sizeUnit: GaugeSizeUnit.logicalPixel,
                            color: Colors.red,
                          ),
                          NeedlePointer(
                              value: match,
                              enableDragging: true,
                              enableAnimation: true,
                              needleColor: Colors.red,
                              needleStartWidth: 1.5,
                              needleEndWidth: 1.5,
                              needleLength: 30,
                              knobStyle: KnobStyle(
                                  color: Colors.white,
                                  borderColor: Colors.red,
                                  borderWidth: 2,
                                  knobRadius: 30,
                                  sizeUnit: GaugeSizeUnit.logicalPixel)
                          )
                        ],
                      )
                    ]
                ),
                HomeScreenButton(context,()async {
                  validation();
                },'Match Birthdate',Colors.white,Colors.white)
              ],
            ),
          )
        ],
      ),
    ));
  }
}

