import 'package:flutter/material.dart';

class ExceptionController with ChangeNotifier {
  String? exception;

  getException(String e) {
    exception = e;
    notifyListeners();
  }

  clearException() {
    exception = null;
    notifyListeners();
  }
}
