import 'package:flutter/material.dart';

import '../../../../core/constants/images_path.dart';

Widget loginHeader(double width,double height)=>Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Center(child: Image(image: const AssetImage(ImagesPath.logo),width: width,height: height*0.2,)),
    const Text(
      'Welcom to CropCompass!',
      style: TextStyle(fontSize: 30, fontFamily: 'fredoka'),
    ),
    const Text(
      'Your future is coming! Make your farm land ready for increase its productivity!',
      style: TextStyle(color: Colors.black54),
    ),
    const SizedBox(
      height: 20,
    ),
  ],
);