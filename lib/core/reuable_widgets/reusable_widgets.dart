import 'package:flutter/material.dart';
import '../../feature/controllers/auth_cubit/auth_cubit.dart';
import '../constants/colors.dart';

/// default form field

Widget defaultFormField(context,{
  required TextEditingController controller,
  required TextInputType type,
  required String validateMessage,
  required IconData prefixIcon,
  IconData ? suffixIcon,
  bool isSecure=false
})=>TextFormField(
  controller: controller,
  keyboardType: type,
  obscureText: isSecure,
  style: const TextStyle(fontWeight: FontWeight.bold),
  validator: (value){
    if (value!.isEmpty){
      return validateMessage;
    }
    return null;
  },
  decoration: InputDecoration(
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
    ),
    prefixIcon: Icon(prefixIcon,),
    suffixIcon: suffixIcon != null ?IconButton(onPressed: (){AuthCubit.get(context).changeIconVisibility();}, icon: Icon(suffixIcon,)):null,
  ),
);

/// default button

Widget defaultButton(String text,VoidCallback onPressed)=>  Container(
  width: double.infinity,
  height: 50,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: AppColors.defaultColor,
  ),
  child: MaterialButton(
      onPressed: onPressed,
      child:   Text(text,style: const TextStyle(color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20),)

  ),
);

Widget snakeBar({
  required String message,
  required IconData icon,
}){
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.defaultColor),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    ),
  );
}