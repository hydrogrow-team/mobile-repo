import 'package:crop_compass/core/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../controllers/auth_cubit/auth_cubit.dart';
import '../../../../controllers/auth_cubit/auth_states.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  List<Step> stepList()=>[
    const Step(title: Text('Account'), content: Center(child: Text('Account'),)),
    const Step(title: Text('Address'), content: Center(child: Text('Address'),)),
    const Step(title: Text('Confirm'), content: Center(child: Text('Confirm'),)),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          backgroundColor: Colors.white,
          body: Padding(
            padding:  EdgeInsets.all(AppConstants.defaultPadding/2),
            child: Container(
              color: Colors.white,
              child: Stepper(
                type: StepperType.horizontal,
                  steps: stepList()
              ),
            ),
          )
        );
      },
    );
  }
}
