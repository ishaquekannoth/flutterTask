import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:task/constants.dart';
import 'package:task/model/data_model.dart';

class DataServices {
  Dio dio = Dio();

  Future<List<DataModel>> fetchDataFromNetwork() async {
    final connectionOk = await InternetConnectionChecker().hasConnection;
    if (connectionOk) {
      try {
        final response = await dio.get(apiUrl);
        if (response.statusCode! >= 200 || response.statusCode! <= 299) {
          log(response.data.toString());
          return List<DataModel>.from(
              response.data.map((x) => DataModel.fromJson(x)));
        }
      } on DioError {
        return [];
      } on Exception {
        return [];
      }
    } else {
      Fluttertoast.showToast(msg: "Oops!! No network");
      return [];
    }

    return [];
  }
}
