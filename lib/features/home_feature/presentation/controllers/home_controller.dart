import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:learn/core/network/DataState.dart';
import 'package:learn/core/usecase/use_case.dart';
import 'package:learn/features/home_feature/domain/entities/category_entitie.dart';
import 'package:learn/features/home_feature/domain/entities/slider_entities.dart';
import 'package:learn/features/home_feature/domain/use_cases/category_usecase.dart';
import 'package:learn/features/home_feature/domain/use_cases/slider_usecase.dart';

class HomeController extends GetxController {
  CategoryUseCase categoryUseCase;
  SliderUseCase sliderUseCase;

  HomeController(this.categoryUseCase, this.sliderUseCase);
  RxBool isListening = false.obs;
  DataState<List<CategoryEntities>>? dataState;
  DataState<List<SliderEntities>>? sliderData;
  RxBool loading = false.obs;
  RxBool sliderLoading = false.obs;
  PageController pageController = PageController(initialPage: 1);
  RxInt activePage = 2.obs;
  TextEditingController questionController = TextEditingController();

  getCategory() async {
    dataState = await categoryUseCase(NoParams());
    if (dataState is DataSuccess) {
      loading.value = true;
      update();
    } else {
      loading.value = false;
      update();
    }
  }

  getSlider() async {
    sliderData = await sliderUseCase(NoParams());
    if (sliderData is DataSuccess) {
      sliderLoading.value = true;
      update();
    } else {
      sliderLoading.value = false;
      update();
    }
  }

  @override
  void onInit() {
    getSlider();
    getCategory();
    super.onInit();
  }
}
