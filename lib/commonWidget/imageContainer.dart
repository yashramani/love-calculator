import 'package:flutter/cupertino.dart';

class ImageContainer extends StatelessWidget {

  final AssetImage image;
  const ImageContainer({Key? key,required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: image,fit: BoxFit.cover)
      ),
    );
  }
}
