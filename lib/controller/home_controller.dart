import 'package:flutter/material.dart';
import 'package:machine_task1/helper/internet_checking.dart';
import 'package:machine_task1/model/all_rockets_model.dart';
import 'package:machine_task1/service/home/home_service.dart';
import 'package:machine_task1/view/rocket_screen/rocket_screen.dart';

class HomeController with ChangeNotifier {
  HomeController() {
    startLoading();
  }
  final List<AllRocketsModel> allRockets = [];
  bool loading = false;
  bool? internetStatus;

  void getAllRockets() async {
    loading = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 1));
    await InternetChecking().hasNetwork().then((value) {
      if (value == true) {
        internetStatus = true;
        notifyListeners();
        HomeService().getRockets().then((value) {
          if (value != null) {
            allRockets.clear();
            allRockets.addAll(value);
            notifyListeners();
            loading = false;
            notifyListeners();
          } else {
            loading = false;
            notifyListeners();
          }
        });
      } else {
        internetStatus = false;
        notifyListeners();
        loading = false;
        notifyListeners();
      }
    });
  }

  void goToSingleRocketScreen(BuildContext context, String id) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => RocketScreen(id: id),
      ),
    );
  }

  void startLoading() {
    loading = true;
    notifyListeners();
  }
}
