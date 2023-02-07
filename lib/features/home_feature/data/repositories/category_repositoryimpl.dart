import 'package:get/get.dart';
import 'package:learn/core/network/DataState.dart';
import 'package:learn/features/home_feature/domain/entities/category_entitie.dart';

import '../../../../core/network/ApiModel.dart';
import '../../domain/repositories/category_repository.dart';
import '../data_sources/category_api.dart';
import '../models/category_model.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  ApiProvider apiProvider;

  CategoryRepositoryImpl(this.apiProvider);

  @override
  Future<DataState<List<CategoryEntities>>> getCategory() async {
    try {
      ApiResult result = await apiProvider.categoryApi();
      if (result.statusCode == 200) {
        RxList<CategoryModel> listOfCat = <CategoryModel>[].obs;
        listOfCat.clear();
        for (var i in result.data) {
          listOfCat.add(CategoryModel.fromJson(i));
        }
        return DataSuccess(listOfCat);
      } else {
        return DataFailed(result.message.toString());
      }
    } catch (e) {
      return const DataFailed("Something Went Wrong. try again...");
    }
  }
}
