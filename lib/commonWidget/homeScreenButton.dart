import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

Widget HomeScreenButton(context, ontap, name, bordercolor, color) {
  return Column(
    children: [
      InkWell(
        child: Container(
          height: MediaQuery.of(context).size.height / 18,
          width: MediaQuery.of(context).size.width / 1.3,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.transparent.withOpacity(0.3),
              border: Border.all(color: bordercolor)),
          child: Center(
              child: Text(
            name,
            style: TextStyle(
                color: color, fontWeight: FontWeight.bold),
          )),
        ),
        onTap: ontap,
      ),
      Gap(20)
    ],
  );
}
