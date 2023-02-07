import '../../../../core/network/ApiHelper.dart';
import '../../../../core/network/ApiModel.dart';

class ApiProvider {
  Future<ApiResult> planeApi() async {
    return await ApiHelper.makeGetRequest(
      path: "plans",
      header: {
        'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1laHJhYjgyQGFzZC5hc2QiLCJwYXNzd29yZCI6IjVhMTA1ZThiOWQ0MGUxMzI5NzgwZDYyZWEyMjY1ZDhhIiwiaWF0IjoxNjc0MzE3NDYxLCJleHAiOjE3MDU4NTM0NjF9.zFgd8oaYPEXQEIV7u4mOr-LFrZ9lFV5X2hNCQXqVBGc',
        // 'Authorization': 'Bearer ${await PrefHelpers.getToken()}',
      },
    );
  }


  Future<ApiResult> getProfile() async {
    return await ApiHelper.makeGetRequest(
      path: "users/me",
      header: {
        'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1laHJhYjgyQGFzZC5hc2QiLCJwYXNzd29yZCI6IjVhMTA1ZThiOWQ0MGUxMzI5NzgwZDYyZWEyMjY1ZDhhIiwiaWF0IjoxNjc0MzE3NDYxLCJleHAiOjE3MDU4NTM0NjF9.zFgd8oaYPEXQEIV7u4mOr-LFrZ9lFV5X2hNCQXqVBGc',
        // 'Authorization': 'Bearer ${await PrefHelpers.getToken()}',
      },
    );
  }


}