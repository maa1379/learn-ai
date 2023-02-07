import 'package:learn/features/settings_feature/domain/entities/plane_entities.dart';

import '../../../../core/network/DataState.dart';

abstract class PlaneRepository{

  Future<DataState<List<PlaneEntities>>> getPlane();

}