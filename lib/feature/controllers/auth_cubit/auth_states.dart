abstract class AuthStates {}

class AuthInitialState extends AuthStates {}

class ChangeIconVisibilityState extends AuthStates {}

class RegisterContinueStepperState extends AuthStates {}

class RegisterCanselStepperState extends AuthStates {}

class RegisterTapStepperState extends AuthStates {}

class LocationLoadingState extends AuthStates {}

class LocationSuccessState extends AuthStates {}

class LocationErrorState extends AuthStates {
  final String error;

  LocationErrorState(this.error);
}

class LocationCityLoadingState extends AuthStates {}

class LocationCitySuccessState extends AuthStates {}

class LocationCityErrorState extends AuthStates {
  final String error;

  LocationCityErrorState(this.error);
}

class ShowMapState extends AuthStates {}
