abstract class AppStates {}

class AppInitialState extends AppStates {}

class AuthInitialState extends AppStates {}

class ChangeIconVisibilityState extends AppStates {}

class RegisterContinueStepperState extends AppStates {}

class RegisterCanselStepperState extends AppStates {}

class RegisterTapStepperState extends AppStates {}

class LocationLoadingState extends AppStates {}

class LocationSuccessState extends AppStates {}

class LocationErrorState extends AppStates {
  final String error;

  LocationErrorState(this.error);
}

class LocationCityLoadingState extends AppStates {}

class LocationCitySuccessState extends AppStates {}

class LocationCityErrorState extends AppStates {
  final String error;

  LocationCityErrorState(this.error);
}

class ShowMapState extends AppStates {}

class ShowAnimatedState extends AppStates {}

class RainLoadingState extends AppStates {}

class RainSuccessState extends AppStates {}

class RainErrorState extends AppStates {
  final String error;

  RainErrorState(this.error);
}

class WeatherLoadingState extends AppStates {}

class WeatherSuccessState extends AppStates {}

class WeatherErrorState extends AppStates {
  final String error;

  WeatherErrorState(this.error);
}

class SolidLoadingState extends AppStates {}

class SolidSuccessState extends AppStates {}

class SolidErrorState extends AppStates {
  final String error;

  SolidErrorState(this.error);
}
