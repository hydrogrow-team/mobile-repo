import 'package:crop_compass/feature/controllers/app_cubit.dart';
import 'package:flutter/material.dart';


Widget animateChart(context,Widget widget)=>AnimatedContainer(
  padding: const EdgeInsets.all(20),
  width: double.infinity,
  height: AppCubit.get(context).isClicked ? 10 : 260,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(12),
  ),
  duration: const Duration(milliseconds: 1000),
  child: AppCubit.get(context) .isClicked?FutureBuilder(
    future: Future.delayed(const Duration(milliseconds: 600)),
    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return  widget; // Loading indicator while waiting
      } else {
        return   const SizedBox(height: 10,);
      }
    },):
  FutureBuilder(
    future: Future.delayed(const Duration(milliseconds: 400)),
    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const SizedBox(height: 0,); // Loading indicator while waiting
      } else {
        return  widget;
      }
    },
  ),
);