import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:machine_task1/helper/app_exceptions.dart';
import 'package:machine_task1/helper/internet_checking.dart';
import 'package:machine_task1/model/single_rocket_model.dart';
import 'package:machine_task1/service/rocket/single_rocket_service.dart';
import 'package:url_launcher/url_launcher.dart';

class SingleRocketController with ChangeNotifier {
  SingleRocketController() {
    startLoading();
  }

  SingleRocketModel? rocket;
  bool loading = false;
  bool? internetStatus;

  void getRocket(String id) async {
    loading = true;
    notifyListeners();
    await Future.delayed(
      const Duration(seconds: 2),
    );
    await InternetChecking().hasNetwork().then((value) async {
      if (value == true) {
        internetStatus == true;
        notifyListeners();
        await SingleRocketService().getSingleRocket(id).then((value) {
          if (value != null) {
            rocket = value;
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

  void startLoading() {
    loading = true;
    notifyListeners();
  }

  void launchWikipidea(String wikipidea) async {
    final parseurl = Uri.parse(wikipidea);
    try {
      launchUrl(parseurl);
    } catch (e) {
      AppExceptions.errorHandler(
        e,
        'RocketScreen',
        null,
      );
    }
  }
}
