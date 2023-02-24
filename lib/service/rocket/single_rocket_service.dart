import 'package:dio/dio.dart';
import 'package:machine_task1/helper/app_exceptions.dart';
import 'package:machine_task1/helper/app_urls.dart';
import 'package:machine_task1/model/single_rocket_model.dart';

class SingleRocketService {
  final Dio dio = Dio();
  Future<SingleRocketModel?> getSingleRocket(String id) async {
    try {
      final Response response = await dio.get('${AppUrls.baseUrl}/$id');

      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        final SingleRocketModel model =
            SingleRocketModel.fromJson(response.data);

        return model;
      }
    } catch (e) {
      AppExceptions.errorHandler(e, 'SingleRocket', id);
    }
    return null;
  }
}
