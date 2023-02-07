import 'package:get/get.dart';
import 'package:learn/core/network/DataState.dart';
import 'package:learn/features/settings_feature/data/models/plane_model.dart';
import 'package:learn/features/settings_feature/data/models/plane_model.dart';
import 'package:learn/features/settings_feature/data/models/plane_model.dart';

import 'package:learn/features/settings_feature/domain/entities/plane_entities.dart';

import '../../../../core/network/ApiModel.dart';
import '../../domain/repositories/plane_repository.dart';
import '../data_sources/settings_api.dart';

class PlaneRepositoryImpl extends PlaneRepository {
  ApiProvider apiProvider;

  PlaneRepositoryImpl(this.apiProvider);

  @override
  Future<DataState<List<PlaneEntities>>> getPlane() async {
    try {
      ApiResult result = await apiProvider.planeApi();
      if (result.statusCode == 200) {
        RxList<PlaneModel> listOfPlane = <PlaneModel>[].obs;
        listOfPlane.clear();
        for (var i in result.data) {
          listOfPlane.add(PlaneModel.fromJson(i));
        }
        return DataSuccess(listOfPlane);
      } else {
        return DataFailed(result.message.toString());
      }
    } catch (e) {
      return const DataFailed("Something Went Wrong. try again...");
    }
  }
}
