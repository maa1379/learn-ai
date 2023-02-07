import 'package:get/get_core/src/get_main.dart';
import 'package:learn/core/PrefHelper/PrefHelpers.dart';

import '../../../../core/network/ApiHelper.dart';
import '../../../../core/network/ApiModel.dart';

class ApiProvider {
  Future<ApiResult> categoryApi() async {
    return await ApiHelper.makeGetRequest(
      path: "categories",
      header: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1laHJhYjgyQGFzZC5hc2QiLCJwYXNzd29yZCI6IjVhMTA1ZThiOWQ0MGUxMzI5NzgwZDYyZWEyMjY1ZDhhIiwiaWF0IjoxNjc0MzE3NDYxLCJleHAiOjE3MDU4NTM0NjF9.zFgd8oaYPEXQEIV7u4mOr-LFrZ9lFV5X2hNCQXqVBGc',
        // 'Authorization': 'Bearer ${await PrefHelpers.getToken()}',
      },
    );
  }


  Future<ApiResult> sliderApi() async {
    return await ApiHelper.makeGetRequest(
      path: "slides",
      header: {
        'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1laHJhYjgyQGFzZC5hc2QiLCJwYXNzd29yZCI6IjVhMTA1ZThiOWQ0MGUxMzI5NzgwZDYyZWEyMjY1ZDhhIiwiaWF0IjoxNjc0MzE3NDYxLCJleHAiOjE3MDU4NTM0NjF9.zFgd8oaYPEXQEIV7u4mOr-LFrZ9lFV5X2hNCQXqVBGc',
        // 'Authorization': 'Bearer ${await PrefHelpers.getToken()}',
      },
    );
  }



  Future<ApiResult> questionApi(String question) async {
    return await ApiHelper.makePostRequest(
      path: "ask",
      body: {
        "question": question,
      },
      header: {
        'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1laHJhYjgyQGFzZC5hc2QiLCJwYXNzd29yZCI6IjVhMTA1ZThiOWQ0MGUxMzI5NzgwZDYyZWEyMjY1ZDhhIiwiaWF0IjoxNjc0MzE3NDYxLCJleHAiOjE3MDU4NTM0NjF9.zFgd8oaYPEXQEIV7u4mOr-LFrZ9lFV5X2hNCQXqVBGc',
        // 'Authorization': 'Bearer ${await PrefHelpers.getToken()}',
      },
    );
  }

}
