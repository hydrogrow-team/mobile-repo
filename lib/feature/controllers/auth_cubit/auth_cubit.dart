import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import '../../../core/helper/location_helper/location_helper.dart';
import '../../../core/reuable_widgets/reusable_widgets.dart';
import 'auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());

  static AuthCubit get(context) => BlocProvider.of(context);

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
  late Position position;
  void getLocationPermission(context) async {
    emit(LocationLoadingState());
    await LocationHelper.determinePosition().then((value) {
      // position = value;
      print(value.longitude);
      print(value.latitude);
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
}
