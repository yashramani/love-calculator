import 'package:flutter/material.dart';
import 'package:love_count/commonWidget/imageContainer.dart';

class LoveSticker extends StatefulWidget {
  const LoveSticker({Key? key}) : super(key: key);

  @override
  _LoveStickerState createState() => _LoveStickerState();
}

class _LoveStickerState extends State<LoveSticker> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Stack(
        children: [
          ImageContainer(
            image: AssetImage('assets/images/quates.jpg'),
          ),
        ],
      ),
    ));
  }
}
