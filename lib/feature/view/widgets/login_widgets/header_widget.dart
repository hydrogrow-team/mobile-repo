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
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      style: TextStyle(color: Colors.black54),
    ),
    const SizedBox(
      height: 20,
    ),
  ],
);