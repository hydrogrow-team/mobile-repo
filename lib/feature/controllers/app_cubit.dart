import 'package:crop_compass/core/constants/constant.dart';
import 'package:crop_compass/feature/models/prediction_model.dart';
import 'package:crop_compass/feature/models/rain_fall.dart';
import 'package:crop_compass/feature/models/soil_model.dart';
import 'package:crop_compass/feature/models/weather_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';

import '../../core/helper/location_helper/location_helper.dart';
import '../../core/reuable_widgets/reusable_widgets.dart';
import 'app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

 /// show animated container
  /// change icon visibility
  bool isVisible = true;

  void changeIconVisibility() {
    isVisible = !isVisible;
    emit(ChangeIconVisibilityState());
  }

  int activeIndex = 0;

  void continueStepper() {
    if (activeIndex < 2) {
      activeIndex += 1;
    }
    emit(RegisterContinueStepperState());
  }

  void canselStepper() {
    if (activeIndex == 0) {
      return;
    }
    activeIndex -= 1;
    emit(RegisterCanselStepperState());
  }

  void tapStepper(int index) {
    activeIndex = index;
    emit(RegisterTapStepperState());
  }

  /// long lat from location
  void getLocationPermission(context) async {
    emit(LocationLoadingState());
    await LocationHelper.determinePosition().then((value) {
      activeIndex=2;
      print(value.longitude);
      print(value.latitude);
      getRainData(lat: value.latitude, lon: value.longitude);
      getWeatherData(lat: value.latitude, lon: value.longitude);
      getSolidData(lat: value.latitude,lon: value.longitude);
      getPredictionData(lat: value.latitude, lon: value.longitude);
      emit(LocationSuccessState());
    }).catchError((error) {
      if (error ==
          'Location permissions are permanently denied, we cannot request permissions.') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: snakeBar(
            message: 'Allow location permission',
            icon: Icons.location_off,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ));
      }
      emit(LocationErrorState(error.toString()));
    });
  }

  /// long lat from city name
  double? latitude;
  double? longitude;
  Future<void> getCoordinatesFromCity(String cityName) async {
    emit(LocationCityLoadingState());
    try {
      List<Location> locations = await locationFromAddress(cityName);
      latitude = locations[0].latitude;
      longitude = locations[0].longitude;
      print(latitude);
      print(longitude);
      emit(LocationCitySuccessState());
    } catch (e) {
      print("Error occurred while trying to find city coordinates: $e");
      emit(LocationCityErrorState(e.toString()));
    }
  }

  /// show map
  bool isMapShow=false;
  void showMap(){
    isMapShow =!isMapShow;
    emit(ShowMapState());
  }

  bool isClicked=false;
  void showAnimatedContainer(){
   isClicked =!isClicked;
   emit(ShowAnimatedState());
 }

 RainFallModel ? rainModel;
 void getRainData({
    required double lat,
    required double lon,
}) async{
    emit(RainLoadingState());
    final response= await Dio().get(AppConstants.rainFall,queryParameters: {
      "lat":lat,
      "lon":lon,
    }).then((value){
      print(value.data);
      rainModel = RainFallModel.fromJson(value.data);
      emit(RainSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(RainErrorState(error.toString()));
    });
 }

  WeatherModel ? weatherModel;
  void getWeatherData({
    required double lat,
    required double lon,
  }) async{
    emit(WeatherLoadingState());
    final response= await Dio().get(AppConstants.weatherUrl,queryParameters: {
      "lat":lat,
      "lon":lon,
    }).then((value){
      print(value.data);
      weatherModel = WeatherModel.fromJson(value.data);
      print(weatherModel!.days[0].temp);
      emit(WeatherSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(WeatherErrorState(error.toString()));
    });
  }


  SoilModel ? soilModel;
  void getSolidData({
    required double lat,
    required double lon,
  }) async{
    emit(SolidLoadingState());
    final response= await Dio().get(AppConstants.solidUrl,queryParameters: {
      "lat":lat,
      "lon":lon,
    }).then((value){
      print(value.data);
      soilModel = SoilModel.fromJson(value.data);
      print(soilModel!.nMean);
      emit(SolidSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(SolidErrorState(error.toString()));
    });
  }


  PredictionModel ? predictionModel;
  void getPredictionData({
    required double lat,
    required double lon,
  }) async{
    emit(PreLoadingState());
    final response= await Dio().get(AppConstants.predictionUrl,queryParameters: {
      "lat":lat,
      "lon":lon,
    }).then((value){
      print(value.data);
      predictionModel = PredictionModel.fromJson(value.data);
      emit(PreSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(PreErrorState(error.toString()));
    });
  }

}