import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_memories/core/cubit/location_Cubit.dart';
import 'package:my_memories/core/cubit/weather_cubit.dart';
import 'package:my_memories/core/network/dio_helper.dart';
import 'package:my_memories/features/auth/screens/signup_screen.dart';
import 'package:my_memories/features/home_screen/screens/home_screen.dart';
import 'package:my_memories/features/splash/screens/splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LocationCubit()),
        BlocProvider(create: (context) => WeatherCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
         
          colorScheme: .fromSeed(seedColor: Colors.deepPurple),
        ),
       // home: SplashScreen(),
       home:HomeScreen(),
      ),
    );
  }
}

