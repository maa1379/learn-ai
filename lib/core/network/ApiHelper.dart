import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:learn/core/PrefHelper/PrefHelpers.dart';
import 'ApiModel.dart';

class ApiHelper {
  static const String baseUrl = 'https://school-ai.iran.liara.run/v1/';

  static Future<ApiResult> makePostRequest({
    String? path,
    Map<String, String> header = const {},
    Map body = const {},
    Map<String, dynamic> queryParameters = const {},
  }) async {
    ApiResult apiResult = ApiResult();
    debugPrint("Url: $baseUrl$path");
    http.Response response = await http.post(
      headers: {
        'Authorization': 'Bearer ${await PrefHelpers.getToken()}',
      },
      Uri.parse(baseUrl + path!),
      body: body,
    );
    print(response.body);
    Map data = jsonDecode(response.body);
    debugPrint("Url: $baseUrl$path");
    debugPrint("Body: ${response.body}");
    debugPrint("Status: ${response.statusCode}");
    debugPrint("Url: ${data['message']}");
    apiResult.data = data['data'];
    apiResult.statusCode = response.statusCode;
    return apiResult;
  }

  static Future<ApiResult> makeGetRequest({
    String? path,
    Map<String, String> header = const {},
    Map<String, dynamic> queryParameters = const {},
  }) async {
    ApiResult apiResult = ApiResult();
    debugPrint("Url: $baseUrl$path");
    http.Response response = await http.get(
      Uri.parse(baseUrl + path!).replace(queryParameters: queryParameters),
      headers: {
        'Authorization': 'Bearer ${await PrefHelpers.getToken()}',
      },
    );
    print(response);
    Map data = jsonDecode(response.body);
    debugPrint("Url: $baseUrl$path");
    debugPrint("Body: ${response.body}");
    debugPrint("Status: ${response.statusCode}");
    debugPrint("Url: ${data['message']}");
    apiResult.data = data['data'];
    apiResult.statusCode = response.statusCode;
    return apiResult;
  }
}
