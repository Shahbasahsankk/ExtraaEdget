import 'package:flutter/material.dart';
import 'package:machine_task1/controller/exception_controller.dart';
import 'package:machine_task1/controller/home_controller.dart';
import 'package:machine_task1/controller/single_rocket_controller.dart';
import 'package:machine_task1/controller/splash_controller.dart';
import 'package:machine_task1/helper/navigator_key.dart';
import 'package:machine_task1/view/home/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SplashController()),
        ChangeNotifierProvider(create: (context) => HomeController()),
        ChangeNotifierProvider(create: (context) => SingleRocketController()),
        ChangeNotifierProvider(create: (context) => ExceptionController()),
      ],
      child: MaterialApp(
        navigatorKey: NavigationService.navigatorKey,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
      ),
    );
  }
}
