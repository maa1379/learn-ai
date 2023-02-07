import 'package:flutter/foundation.dart';
import 'package:learn/features/home_feature/domain/entities/category_entitie.dart';
import 'package:learn/features/home_feature/domain/repositories/category_repository.dart';

import '../../../../core/network/DataState.dart';
import '../../../../core/usecase/use_case.dart';
import '../../data/models/category_model.dart';

class CategoryUseCase extends UseCase<DataState<List<CategoryEntities>>, NoParams> {
  final CategoryRepository categoryRepository;

  CategoryUseCase(this.categoryRepository);

  @override
  Future<DataState<List<CategoryEntities>>> call(NoParams param) {
    return categoryRepository.getCategory();
  }
}
