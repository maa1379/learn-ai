import 'package:get/get.dart';

import '../features/splash_feature/presentation/controller/SplashController.dart';




class BindingsController extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }

}