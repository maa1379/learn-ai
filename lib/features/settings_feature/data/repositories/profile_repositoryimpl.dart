import 'package:learn/core/network/DataState.dart';
import 'package:learn/features/settings_feature/data/models/profile_model.dart';
import 'package:learn/features/settings_feature/domain/entities/profile_entities.dart';
import 'package:learn/features/settings_feature/domain/repositories/profile_repository.dart';

import '../../../../core/network/ApiModel.dart';
import '../data_sources/settings_api.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  @override
  Future<DataState<ProfileEntities>> getProfile() async {
    try {
      ApiResult result = await apiProvider.getProfile();
      if (result.statusCode == 200) {
        ProfileModel profileModel = ProfileModel.fromJson(result.data);
        return DataSuccess(profileModel);
      } else {
        return DataFailed(result.message.toString());
      }
    } catch (e) {
      return const DataFailed("Something Went Wrong. try again...");
    }
  }

  ApiProvider apiProvider;

  ProfileRepositoryImpl(this.apiProvider);
}
