import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/helper/cashe_helper/shared_prefernce.dart';
import 'core/helper/dio_helper/dio_helper.dart';
import 'feature/controllers/auth_cubit/auth_cubit.dart';
import 'feature/controllers/bloc_observer.dart';
import 'feature/view/screens/auth_screens/login_screen/login_screen.dart';
import 'feature/view/screens/auth_screens/register_screen/register_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CashHelper.init();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp( const MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
   const MyApp({super.key,});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>AuthCubit()),
      ],
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: RegisterScreen() ),
    );
  }
}