import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:learn/core/PrefHelper/PrefHelpers.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SplashController extends GetxController {
  RxInt activeIndex = 0.obs;
  CarouselController pageController = CarouselController();

  @override
  void onInit() {
    Future.delayed(3.seconds).then(
      (value) async {
        if (await PrefHelpers.getToken() == null) {
          FlutterNativeSplash.remove();
          Get.toNamed("/");
        } else {
          FlutterNativeSplash.remove();
          Get.toNamed("/home");
        }
      },
    );
    super.onInit();
  }
}
