import 'package:crop_compass/core/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../controllers/auth_cubit/auth_cubit.dart';
import '../../../../controllers/auth_cubit/auth_states.dart';
import '../../../widgets/login_widgets/footer_widget.dart';
import '../../../widgets/login_widgets/form_widget.dart';
import '../../../widgets/login_widgets/header_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {},
      builder: (context, state) {
        double width=MediaQuery.of(context).size.width;
        double height=MediaQuery.of(context).size.height;
        return Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding:  EdgeInsets.all(AppConstants.defaultPadding),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// header
                      loginHeader(width,height),
                      /// form field
                      loginForm(context,passwordController: passwordController,emailController: emailController,formKey: formKey),
                      /// footer
                      footerWidget(context)                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
