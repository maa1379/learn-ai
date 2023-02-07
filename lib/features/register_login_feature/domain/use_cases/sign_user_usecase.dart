import '../../../../core/network/DataState.dart';
import '../../../../core/params/Params.dart';
import '../../../../core/usecase/use_case.dart';

import '../entities/sign_up_entities.dart';
import '../repositories/sign_repository.dart';

class SignUpUserUseCase extends UseCase<DataState<SignEntities>, SignUpParam> {
  final SignRepository signUserRepository;

  SignUpUserUseCase(this.signUserRepository);

  @override
  Future<DataState<SignEntities>> call(SignUpParam param) {
    return signUserRepository.signUpUser(param);
  }
}

class SignInUserUseCase extends UseCase<DataState<SignEntities>, SignInParam> {
  final SignRepository signUserRepository;

  SignInUserUseCase(this.signUserRepository);

  @override
  Future<DataState<SignEntities>> call(SignInParam param) {
    return signUserRepository.signInUser(param);
  }
}
