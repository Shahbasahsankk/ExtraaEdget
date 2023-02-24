import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:machine_task1/controller/exception_controller.dart';
import 'package:machine_task1/helper/navigator_key.dart';
import 'package:provider/provider.dart';

class AppExceptions {
  static void errorHandler(Object e, String screen, String? id) {
    final controller = Provider.of<ExceptionController>(
        NavigationService.navigatorKey.currentContext!,
        listen: false);
    if (e is SocketException) {
      controller.getException('ConectionError');
    } else if (e is TimeoutException) {
      controller.getException('TimeError');
    } else if (e is DioError) {
      if (e.type == DioErrorType.connectionTimeout) {
        controller.getException('TimeError');
      } else if (e.type == DioErrorType.sendTimeout) {
        controller.getException('SendError');
      } else if (e.type == DioErrorType.cancel) {
        controller.getException('CancelError');
      } else if (e.type == DioErrorType.badResponse) {
        controller.getException('BadError');
      } else if (e.error is SocketException) {
        controller.getException('InternetError');
      }
    }
  }
}
