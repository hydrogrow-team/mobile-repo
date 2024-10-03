import 'package:crop_compass/core/constants/colors.dart';
import 'package:crop_compass/core/constants/images_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/helper/helper_functions/helper_functions.dart';
import '../../../../../core/reuable_widgets/reusable_widgets.dart';
import '../../../../controllers/auth_cubit/auth_cubit.dart';
import '../../../../controllers/auth_cubit/auth_states.dart';
import '../../../widgets/register_widgets/account_widget.dart';
import '../../../widgets/register_widgets/map_widget.dart';
import '../../../widgets/register_widgets/register_stepper_widget.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
        List<Step> stepList() => [
              stepWidget(
                  activeIndex: cubit.activeIndex,
                  index: 0,
                  title: 'Account',
                  widget: accountForm(
                    context,
                    emailController: emailController,
                    passwordController: passwordController,
                    formKey: formKey,
                    nameController: nameController,
                  )),
          stepWidget(
                  activeIndex: cubit.activeIndex,
                  index: 1,
                  title: 'Address',
                  widget:cubit.isMapShow ?OpenStreetMapExample(): Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            defaultButton('Mobile location', 200, (){
                              cubit.getLocationPermission(context);
                            }),
                            const SizedBox(height: 30,),
                            defaultButton('Write location', 200, (){
                              cubit.getCoordinatesFromCity('Cairo');
                            }),
                            const SizedBox(height: 30,),
                            defaultButton('Open Map', 200, (){
                              cubit.showMap();
                            }),
                          ],
                  )),
          stepWidget(
                  activeIndex: cubit.activeIndex,
                  index: 2,
                  title: 'Confirm',
                  widget: const  Center(
                      child: Image(image: AssetImage(ImagesPath.confirm),))),

            ];

        return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            backgroundColor: Colors.white,
            body: Stepper(
              type: StepperType.horizontal,
              steps: stepList(),
              currentStep: cubit.activeIndex,
              onStepContinue: () {
                cubit.continueStepper();
              },
              onStepCancel: () {
                cubit.canselStepper();
              },
              onStepTapped: (index){
                if(cubit.activeIndex==0){
                  if(formKey.currentState!.validate()){
                    cubit.tapStepper(index);
                  }
                }else{
                  cubit.tapStepper(index);
                }
              },
              controlsBuilder: (BuildContext context, ControlsDetails details) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // IconButton(onPressed: cubit.activeIndex == 0
                      //     ? () {
                      //   if (formKey.currentState != null && formKey.currentState!.validate()) {
                      //     details.onStepContinue!();
                      //   }
                      // }
                      //     : details.onStepContinue!,
                      //     icon: Icon(Icons.arrow_circle_right_outlined,size: 50,color: AppColors.defaultColor,)),
                      //
                      // if(cubit.activeIndex !=0)
                      // const SizedBox(width: 10,),
                      // if(cubit.activeIndex !=0)
                      //   IconButton(onPressed: details.onStepCancel, icon: Icon(Icons.arrow_circle_left_outlined,size: 50,color: AppColors.defaultColor,))
                    ],
                  ),
                );
              },
            ));
      },
    );
  }
}
