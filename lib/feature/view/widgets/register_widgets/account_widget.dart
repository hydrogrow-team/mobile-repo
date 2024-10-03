import 'package:flutter/material.dart';

import '../../../../core/reuable_widgets/reusable_widgets.dart';
import '../../../controllers/auth_cubit/auth_cubit.dart';

Widget accountForm(context,{
  required TextEditingController emailController,
  required TextEditingController passwordController,
  required TextEditingController nameController,
  required GlobalKey<FormState> formKey,
})=>Form(
  key: formKey,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Text(
            '⁕           ',
            style:
            TextStyle(color: Colors.red.withOpacity(0.7), fontSize: 27),
          ),
          const Text(
            'Name',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ],
      ),
      const SizedBox(
        height: 7,
      ),
      defaultFormField(context,
          controller: nameController,
          type: TextInputType.text,
          validateMessage: 'Name must not be empty',
          prefixIcon: Icons.person),
      const SizedBox(
        height: 15,
      ),
      Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Text(
            '⁕           ',
            style:
            TextStyle(color: Colors.red.withOpacity(0.7), fontSize: 27),
          ),
          const Text(
            'Email',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ],
      ),
      const SizedBox(
        height: 7,
      ),
      defaultFormField(context,
          controller: emailController,
          type: TextInputType.emailAddress,
          validateMessage: 'Email must not be empty',
          prefixIcon: Icons.email),
      const SizedBox(
        height: 15,
      ),
      Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Text(
            '⁕                ',
            style:
            TextStyle(color: Colors.red.withOpacity(0.7), fontSize: 27),
          ),
          const Text(
            'Password',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ],
      ),
      const SizedBox(
        height: 7,
      ),
      defaultFormField(context,
          controller: passwordController,
          type: TextInputType.visiblePassword,
          suffixIcon: AuthCubit.get(context).isVisible
              ? Icons.visibility
              : Icons.visibility_off,
          isSecure: AuthCubit.get(context).isVisible,
          validateMessage: 'Password must not be empty',
          prefixIcon: Icons.lock),
      const SizedBox(
        height: 20,
      ),
    ],
  ),
);