import 'package:flutter/material.dart';

import '../../../../core/reuable_widgets/reusable_widgets.dart';
import '../../../controllers/auth_cubit/auth_cubit.dart';

Widget loginForm(
  context, {
  required TextEditingController emailController,
  required TextEditingController passwordController,
  required GlobalKey<FormState> formKey,
}) =>
    Form(
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
          defaultButton('Login', double.infinity, () {
            if (formKey.currentState!.validate()) {}
          }),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
