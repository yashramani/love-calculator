import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:love_count/commonWidget/homeScreenButton.dart';
import 'package:love_count/commonWidget/imageContainer.dart';


class MatchBirthDate extends StatefulWidget {
  const MatchBirthDate({Key? key}) : super(key: key);

  @override
  _MatchBirthDateState createState() => _MatchBirthDateState();
}

class _MatchBirthDateState extends State<MatchBirthDate> {

   static final DateTime yourbdate =  DateTime.now();
   static final DateTime partnerbdate =  DateTime.now();
   late String yourbdateformat = 'Select Your Birthdate';
   late String partnerbdateformat = 'Select Your Partner Birthdate';

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Stack(
        children: [
          const ImageContainer(image: AssetImage('assets/images/matchbday.jpg')),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HomeScreenButton(context,(){
                  DatePicker.showDatePicker(context,
                      showTitleActions: true,
                      minTime: DateTime(1900, 1, 1),
                      maxTime: DateTime(2022, 12, 12), onChanged: (date) {
                        setState(() {
                          date = yourbdate;
                          yourbdateformat = DateFormat('yyyy-MM-dd').format(yourbdate);
                        });
                      },

                         currentTime: DateTime.now(), locale: LocaleType.en);
                },yourbdateformat == null?'Select Your Birthdate':yourbdateformat,Colors.pink,Colors.white),
                const SizedBox(height: 20.0,),
                HomeScreenButton(context,(){
                  DatePicker.showDatePicker(context,
                      showTitleActions: true,
                      minTime: DateTime(1900, 1, 1),
                      maxTime: DateTime(2022, 12, 12), onChanged: (date) {
                        setState(() {
                          date = partnerbdate;
                        });

                      }, onConfirm: (date) {
                        setState(() {
                          date = partnerbdate;
                          partnerbdateformat = DateFormat('yyyy-MM-dd').format(partnerbdate);
                          print(partnerbdateformat);
                        });
                      }, currentTime: DateTime.now(), locale: LocaleType.en);
                },partnerbdateformat == null?'Select Your partner Birthdate':partnerbdateformat,Colors.pink,Colors.white)
              ],
            ),
          )
        ],
      ),
    ));
  }
}

