import 'dart:async';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'Prefs.dart';

class PrefHelpers {
  static Future<void> setToken(String token) async {
    await Prefs.set('token', token);
  }

  static Future<String?> getToken() async {
    return await (Prefs.get('token'));
  }

  static removeToken() async {
    return await Prefs.clear('token');
  }


  static void logOut() {
    removeToken();
    // ViewHelper.showLoading();
    Future.delayed(const Duration(seconds: 2)).then((value) {
      EasyLoading.dismiss();
      Get.offAllNamed("/login");
    });
  }
}
