import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

import 'model.dart';

class ApiProvider {
  ApiProvider._();
  static Dio dio = Dio()
      // ..interceptors.add(PrettyDioLogger(
      //   requestHeader: true,
      //   requestBody: true,
      //   responseBody: true,
      //   responseHeader: false,
      //   compact: false,
      // ))
      ;
  static final ApiProvider instance = ApiProvider._();

  static const Map<String, String> apiHeaders = {
    "Content-Type": "application/json",
    "Accept": "application/json, text/plain, */*",
    // "X-Requested-With": "XMLHttpRequest",
  };
  static bool isValidResponse(int statusCode) {
    return statusCode >= 200 && statusCode <= 302;
  }

  Future<List<Launches>> launchRequest() async {
    // Json Data

    var _response =
        await dio.get('https://api.spacexdata.com/v5/launches?Auth required=0',
            // data: _data,
            options: Options(
              headers: {...apiHeaders},
              validateStatus: (status) {
                return status < 500;
              },
            ));
    if (isValidResponse(_response.statusCode)) {
      // OK

      List<Launches> list = [];

      List<dynamic> s =
          _response.data.map((job) => Launches.fromJson(job)).toList();
      // list.addAll(s);
      for (var i in s) {
        list.add(i);
      } // debugPrint("{list} + ${s.length}");

      debugPrint("{list} + ${list.length}");
      return list;
    } else {
      debugPrint("  ${_response.statusCode} + ${_response.data}");
      // throw ApiException.fromApi(_response.statusCode, _response.data);
    }
  }
}
