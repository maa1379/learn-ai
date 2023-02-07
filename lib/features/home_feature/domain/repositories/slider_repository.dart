import 'package:learn/features/home_feature/domain/entities/slider_entities.dart';

import '../../../../core/network/DataState.dart';

abstract class SliderRepository{

  Future<DataState<List<SliderEntities>>> getSlider();


}