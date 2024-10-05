import 'package:crop_compass/core/constants/images_path.dart';
import 'package:crop_compass/core/helper/helper_functions/helper_functions.dart';
import 'package:crop_compass/feature/controllers/app_cubit.dart';
import 'package:crop_compass/feature/view/widgets/home_widgets/animate_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../controllers/app_states.dart';
import '../../widgets/home_widgets/charts.dart';
import '../../widgets/home_widgets/home_widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
        builder: (context ,state){
        var cubit=AppCubit.get(context);
        double width=HelperFunctions.getScreenWidth(context);
        double height=HelperFunctions.getScreenHeight(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('Dashboard',style: TextStyle(
              fontFamily: 'fredoka',
              fontSize: 25
            ),),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  itemWidget(context, image: ImagesPath.weather, text: 'Temperature', width: width, height: height, onTap: () {                     cubit.showAnimatedContainer();
                  },),
                  animateChart(context, WeatherWidget(model: AppCubit.get(context).weatherModel!, isDew: false, isHum: false,)),
                  const SizedBox(height: 10,),
                  itemWidget(context, image: ImagesPath.weather, text: 'Rain Fall', width: width, height: height, onTap: () {
                    cubit.showAnimatedContainer();
                  },),
                  animateChart(context,  RainFallWidget(model: AppCubit.get(context).rainModel!,) ),
                  itemWidget(context, image: ImagesPath.weather, text: 'Humidity', width: width, height: height, onTap: () {  },),
                  animateChart(context,  WeatherWidget(model: AppCubit.get(context).weatherModel!, isDew: false,isHum: true,) ),
                  const SizedBox(height: 10,),
                  itemWidget(context, image: ImagesPath.weather, text: 'Dew Point', width: width, height: height, onTap: () {  },),
                  animateChart(context,  WeatherWidget(model: AppCubit.get(context).weatherModel!, isDew: true,isHum: false,) ),
                  const SizedBox(height: 10,),
                  itemWidget(
                    context,
                    isN: true,
                    image: ImagesPath.weather, text: 'Nitrogen % = ${cubit.soilModel!.nMean}', width: width, height: height, onTap: () {  },),
                  const SizedBox(height: 10,),
                  itemWidget(
                    context,
                    isN: true,
                    image: ImagesPath.weather, text: 'PH = ${cubit.soilModel!.phMean}', width: width, height: height, onTap: () {  },),

                ],
              ),
            ),
          ),
        );
        }, );
  }
}