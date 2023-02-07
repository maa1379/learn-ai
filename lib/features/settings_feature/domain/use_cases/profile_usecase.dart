import 'package:learn/features/settings_feature/domain/entities/profile_entities.dart';
import 'package:learn/features/settings_feature/domain/repositories/profile_repository.dart';

import '../../../../core/network/DataState.dart';
import '../../../../core/usecase/use_case.dart';

class ProfileUseCase extends UseCase<DataState<ProfileEntities>, NoParams> {
  ProfileRepository profileRepository;


  ProfileUseCase(this.profileRepository);

  @override
  Future<DataState<ProfileEntities>> call(NoParams param) {
    return profileRepository.getProfile();
  }

}