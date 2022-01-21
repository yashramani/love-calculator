import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'dart:math';
import 'package:love_count/commonWidget/homeScreenButton.dart';
import 'package:love_count/commonWidget/imageContainer.dart';
import 'package:love_count/commonWidget/textfeild.dart';
import 'package:random_string/random_string.dart';

class CheckPartnerName extends StatefulWidget {
  const CheckPartnerName({Key? key}) : super(key: key);

  @override
  _CheckPartnerNameState createState() => _CheckPartnerNameState();
}

class _CheckPartnerNameState extends State<CheckPartnerName> {

  final _formKey = GlobalKey<FormState>();
  late String? pname = '';
  TextEditingController yourname = TextEditingController();

  validation() {
    if (_formKey.currentState!.validate()) {
      yourname.clear();
      GenerateCharactor();
    } else {
      print('Getting Some Error');
    }
  }

  GenerateCharactor(){
    String randomchar = randomAlpha(1);
    print('+++++++++++++++++');
    print(randomchar);
    setState(() {
      pname = randomchar;
      print('-------------------');
      print(pname);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          const ImageContainer(
            image: AssetImage('assets/images/checkname.jpg'),
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
                      style: TextStyle(color: Colors.pink, fontSize: 25),
                    ),
                    Gap(10),
                    CommonTextFormFeild(fontcolor: Colors.white,fontsize: 25,focuscolor: Colors.pink,controller: yourname,borderColor: Colors.pink,cursorcolor: Colors.pink,hint: 'Your name',hinttextColor: Colors.pink),
                    Gap(100),
                    Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height / 10,
                      width: MediaQuery.of(context).size.width / 4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.transparent.withOpacity(0.2),
                          border: Border.all(color: Colors.pink)),
                      child: Center(child: Text("$pname",style: TextStyle(fontFamily: 'ZenTokyo',fontSize: 80.0,color: Colors.pink),),
                      ),
                    ),
                    Spacer(),
                    HomeScreenButton(context, () {
                      validation();
                    }, 'Check Charactor', Colors.pink, Colors.pink),
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


