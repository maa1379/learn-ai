import 'package:learn/core/network/DataState.dart';


import '../../../../core/params/Params.dart';

import '../entities/sign_up_entities.dart';

abstract class SignRepository {
  Future<DataState<SignEntities>> signUpUser(SignUpParam signParam);

  Future<DataState<SignEntities>> signInUser(SignInParam param);

}
