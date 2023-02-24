import 'package:flutter/material.dart';
import 'package:machine_task1/view/home/home_screen.dart';

class SplashController with ChangeNotifier {
  void splash(BuildContext context) async {
    await Future.delayed(
      const Duration(seconds: 3),
    );
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
        (route) => false);
  }
}
