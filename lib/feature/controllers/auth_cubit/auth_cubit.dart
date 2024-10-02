import 'package:flutter_bloc/flutter_bloc.dart';
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

}