import 'package:get/get.dart';
import 'package:learn/core/network/DataState.dart';
import 'package:learn/features/home_feature/data/data_sources/category_api.dart';
import 'package:learn/features/home_feature/data/models/slider_model.dart';
import 'package:learn/features/home_feature/domain/entities/slider_entities.dart';
import 'package:learn/features/home_feature/domain/repositories/slider_repository.dart';

import '../../../../core/network/ApiModel.dart';

class SliderRepositoryImpl extends SliderRepository {
  ApiProvider apiProvider;

  SliderRepositoryImpl(this.apiProvider);

  @override
  Future<DataState<List<SliderEntities>>> getSlider() async {
    ApiResult result = await apiProvider.sliderApi();
    try {
      if (result.statusCode == 200) {
        RxList<SliderModel> listOfSlider = <SliderModel>[].obs;
        listOfSlider.clear();
        for (var i in result.data) {
          listOfSlider.add(SliderModel.fromJson(i));
        }
        return DataSuccess(listOfSlider);
      } else {
        return DataFailed(result.message.toString());
      }
    } catch (e) {
      return const DataFailed("Something Went Wrong. try again...");
    }
  }
}
