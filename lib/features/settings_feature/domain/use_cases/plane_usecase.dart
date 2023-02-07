import 'package:learn/core/usecase/use_case.dart';
import 'package:learn/features/settings_feature/domain/entities/plane_entities.dart';
import 'package:learn/features/settings_feature/domain/repositories/plane_repository.dart';

import '../../../../core/network/DataState.dart';

class PlaneUseCase extends UseCase<DataState<List<PlaneEntities>>, NoParams> {
  final PlaneRepository planeRepository;

  PlaneUseCase(this.planeRepository);

  @override
  Future<DataState<List<PlaneEntities>>> call(NoParams param) {
    return planeRepository.getPlane();
  }
}
