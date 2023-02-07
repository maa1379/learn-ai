import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn/core/widgets/Costance.dart';

import '../../../../injector.dart';
import '../controller/SignUpController.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final controller = Get.put(SignController(locator(), locator()));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: SizedBox(
          height: Get.height * .1,
          width: Get.width,
          child: Column(
            children: [
              UiHelper.btnHelper(
                text: "Sign Up",
                onTap: () {
                  if (controller.formKey.currentState!.validate()) {
                    controller.signUp();
                  }
                },
              ),
            ],
          ),
        ),
        body: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UiHelper.backIconBtn(),
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      SizedBox(
                        height: Get.height * .025,
                      ),
                      buildTitle(),
                      SizedBox(
                        height: Get.height * .05,
                      ),
                      UiHelper.input(
                        controller: controller.name,
                        label: "Name",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter name!";
                          }
                        },
                      ),
                      SizedBox(
                        height: Get.height * .025,
                      ),
                      UiHelper.input(
                        controller: controller.email,
                        label: "Username",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter Username!";
                          }
                        },
                      ),
                      SizedBox(
                        height: Get.height * .025,
                      ),
                      UiHelper.input(
                        controller: controller.password,
                        label: "Password",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter Password!";
                          }
                        },
                      ),
                      SizedBox(
                        height: Get.height * .025,
                      ),
                      UiHelper.input(
                        controller: controller.code,
                        label: "Referral Code(Optional)",
                        validator: (value) {},
                      ),
                      SizedBox(
                        height: Get.height * .025,
                      ),
                      buildForgotBtn(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Center buildTitle() {
    return const Center(
      child: Text(
        "Create New Account",
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
      ),
    );
  }

  Padding buildForgotBtn() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width * .08),
      child: Center(
        child: TextButton(
          onPressed: () {},
          child: const Text(
            "By signing up you will accept our Term of services and Privacy policy",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: ColorsHelper.blue,
                fontWeight: FontWeight.normal,
                fontSize: 14),
          ),
        ),
      ),
    );
  }
}
