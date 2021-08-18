import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/cat_image.dart';

class ImageScreen extends StatelessWidget{
  const ImageScreen({
    Key? key,
    required this.image,
  }) : super(key: key);

  final CatImage image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cat image"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: NetworkImage(image.url!),
          )
        ],
      ),
    );
  }

}