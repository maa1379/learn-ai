import '../../../../core/network/DataState.dart';
import '../entities/profile_entities.dart';

abstract class ProfileRepository{

  Future<DataState<ProfileEntities>> getProfile();

}