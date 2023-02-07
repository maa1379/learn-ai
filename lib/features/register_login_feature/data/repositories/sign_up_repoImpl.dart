import 'package:learn/core/network/ApiModel.dart';
import 'package:learn/core/network/DataState.dart';
import '../../../../core/PrefHelper/PrefHelpers.dart';
import '../../../../core/params/Params.dart';
import '../../domain/entities/sign_up_entities.dart';
import '../../domain/repositories/sign_repository.dart';
import '../data_sources/sign_up_api.dart';
import '../models/SignUpModel.dart';

class SignUpRepoImpl extends SignRepository {
  ApiProvider apiProvider;

  SignUpRepoImpl(this.apiProvider);

  @override
  Future<DataState<SignEntities>> signUpUser(SignUpParam signParam) async {
    try {
      ApiResult result = await apiProvider.signUpApi(signUpParam: signParam);
      if (result.statusCode == 201) {
        SignModel model = SignModel.fromJson(result.data);
        PrefHelpers.setToken(model.jwt.toString());
        return DataSuccess(model);
      } else {
        return DataFailed(result.message.toString());
      }
    } catch (e) {
      return const DataFailed("Something Went Wrong. try again...");
    }
  }



  @override
  Future<DataState<SignEntities>> signInUser(SignInParam param) async {
    try {
      ApiResult result = await apiProvider.signInApi(signInParam: param);
      if (result.statusCode == 200) {
        SignModel model = SignModel.fromJson(result.data);
        return DataSuccess(model);
      } else {
        return DataFailed(result.message.toString());
      }
    } catch (e) {
      return const DataFailed("Something Went Wrong. try again...");
    }
  }
}
