import 'package:crop_compass/core/helper/helper_functions/helper_functions.dart';
import 'package:crop_compass/feature/view/screens/auth_screens/register_screen/register_screen.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';

Widget footerWidget(context)=>Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    const Text(
      "Don't have an account? ",
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
    GestureDetector(
      onTap: () {
        HelperFunctions.navigateTo(context, RegisterScreen());
      },
      child: Text(
        'SIGN UP',
        style: TextStyle(
          fontSize: 20,
          color: AppColors.defaultColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ],
);