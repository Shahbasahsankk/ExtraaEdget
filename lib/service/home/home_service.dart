import 'package:dio/dio.dart';
import 'package:machine_task1/helper/app_urls.dart';
import 'package:machine_task1/helper/app_exceptions.dart';
import 'package:machine_task1/model/all_rockets_model.dart';

class HomeService {
  final Dio dio = Dio();
  Future<List<AllRocketsModel>?> getRockets() async {
    try {
      final response = await dio.get(AppUrls.baseUrl);

      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        final List<AllRocketsModel> allRockets = (response.data as List)
            .map((e) => AllRocketsModel.fromJson(e))
            .toList();
        return allRockets;
      }
    } catch (e) {
      AppExceptions.errorHandler(e, 'Home', null);
    }
    return null;
  }
}
