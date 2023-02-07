import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:learn/core/params/Params.dart';
import 'package:learn/core/widgets/Costance.dart';

import '../../../../core/PrefHelper/PrefHelpers.dart';
import '../../../../core/network/DataState.dart';
import '../../domain/entities/sign_up_entities.dart';
import '../../domain/use_cases/sign_user_usecase.dart';

class SignController extends GetxController {
  final SignUpUserUseCase signUpUserUseCase;
  final SignInUserUseCase signInUserUseCase;

  SignController(this.signUpUserUseCase, this.signInUserUseCase);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController code = TextEditingController();

  void signUp() async {
    DataState<SignEntities> data = await signUpUserUseCase(
      SignUpParam(
        email: email.text,
        name: name.text,
        password: password.text,
      ),
    );

    if (data is DataSuccess) {
      ViewHelper.showSuccessDialog(
          "Register Successful , Please check your email");
    } else if (data is DataFailed) {
      ViewHelper.showErrorDialog(data.error.toString());
    }
  }

  void signIn() async {
    DataState<SignEntities> data = await signInUserUseCase(
      SignInParam(
        email: email.text,
        name: "",
        password: password.text,
      ),
    );
    if (data is DataSuccess) {
      PrefHelpers.setToken(data.data!.jwt.toString());
      ViewHelper.showSuccessDialog("Login Successful");
      Get.offAllNamed("/home");
    } else if (data is DataFailed) {
      ViewHelper.showErrorDialog(data.error.toString());
    }
  }
}
