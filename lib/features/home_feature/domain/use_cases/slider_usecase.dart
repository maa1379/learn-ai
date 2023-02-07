import 'package:learn/features/home_feature/domain/entities/slider_entities.dart';
import 'package:learn/features/home_feature/domain/repositories/slider_repository.dart';

import '../../../../core/network/DataState.dart';
import '../../../../core/usecase/use_case.dart';
import '../entities/category_entitie.dart';

class SliderUseCase extends UseCase<DataState<List<SliderEntities>>, NoParams> {
  final SliderRepository sliderRepository;

  SliderUseCase(this.sliderRepository);

  @override
  Future<DataState<List<SliderEntities>>> call(NoParams param) {
    return sliderRepository.getSlider();
  }
}
