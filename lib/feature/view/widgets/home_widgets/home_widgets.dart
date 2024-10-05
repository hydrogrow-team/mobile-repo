import 'package:flutter/material.dart';

Widget itemWidget(context,{
  required String image,
  required String text,
  required double width,
  required double height,
  required Function()onTap,
   bool isN=false
})=>SizedBox(
  width: double.infinity,
  height: 70,
  child: GestureDetector(
    onTap: onTap,
    child: Card(
      elevation: 5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image(image: AssetImage(image),width: width*0.2,height: height*0.2,),
          Text(text,style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              fontFamily: 'fredoka'
          ),),
          isN ? const Icon(Icons.arrow_forward_ios_outlined,color: Colors.black,):SizedBox(width: 0,height: 0,)
        ],
      ),
    ),
  ),
);
