import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn/core/widgets/Costance.dart';

import '../../../../injector.dart';

import '../controller/SignUpController.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);

  final controller = Get.put(SignController(locator(), locator()));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: SizedBox(
          height: Get.height * .16,
          width: Get.width,
          child: Column(
            children: [
              UiHelper.btnHelper(
                text: "Sign In",
                onTap: () {
                  if (controller.formKey.currentState!.validate()) {
                    controller.signIn();
                  }
                },
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                height: Get.height * .06,
                width: Get.width * .8,
                decoration: BoxDecoration(
                    borderRadius: UiHelper.borderRadius16,
                    border: Border.all(color: ColorsHelper.darkGray)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/image 1349.png",
                      width: Get.width * .08,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Sign In With Google",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ],
                ),
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
                    buildForgotBtn(),
                  ],
                ))
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
        "Welcome Back",
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
      ),
    );
  }

  Center buildForgotBtn() {
    return Center(
      child: TextButton(
        onPressed: () {},
        child: const Text(
          "Forget password",
          style: TextStyle(
            color: ColorsHelper.blue,
            fontWeight: FontWeight.normal,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
