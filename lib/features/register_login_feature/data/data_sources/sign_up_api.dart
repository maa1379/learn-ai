
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:learn/core/network/ApiHelper.dart';
import 'package:learn/core/network/ApiModel.dart';

import '../../../../core/params/Params.dart';

class ApiProvider {
  Future<ApiResult> signUpApi({
    SignUpParam? signUpParam,
  }) async {
    print(signUpParam?.name);
    return await ApiHelper.makePostRequest(
      path: "users/",
      body: {
        "name": signUpParam?.name,
        "email": signUpParam?.email,
        "password": signUpParam?.password
      },
    );
  }

  Future<ApiResult> signInApi({
    SignInParam? signInParam,
  }) async {
    print(signInParam);
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    return await ApiHelper.makePostRequest(
      path: "users/login/",
      body: {
        "email": signInParam?.email,
        "password": signInParam?.password,
        "fcm": messaging.getToken().toString()
      },
    );
  }
}
