


import 'package:learn/features/home_feature/domain/entities/category_entitie.dart';

import '../../../../core/network/DataState.dart';
import '../../../register_login_feature/domain/entities/sign_up_entities.dart';

abstract class CategoryRepository {
  Future<DataState<List<CategoryEntities>>> getCategory();
}
