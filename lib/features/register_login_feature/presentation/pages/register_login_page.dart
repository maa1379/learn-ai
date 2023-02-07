import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn/core/widgets/Costance.dart';
import 'package:shimmer/shimmer.dart';

class RegisterAndLoginPage extends StatelessWidget {
  const RegisterAndLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Center(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  "assets/images/Signup and Sign in.png",
                  fit: BoxFit.fill,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: Get.height * .15),
                    child: Image.asset(
                      "assets/images/Group 2268 (1).png",
                      width: Get.width,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: Get.height * .18,
                      left: Get.width * .1,
                      right: Get.width * .1),
                  child: Center(
                    child: Shimmer.fromColors(
                      baseColor: Colors.black,
                      highlightColor: Colors.grey,
                      loop: 2,
                      child: const Text(
                        "Solve Any Problem, learn and amuse!",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 36),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    UiHelper.borderBtnHelper(
                        width: Get.width * .8, text: "Sign Up", onTap: () {
                      Get.toNamed("/signUp");
                    }),
                    SizedBox(
                      height: Get.height * .01,
                    ),
                    UiHelper.btnHelper(
                        width: Get.width * .8, text: "Sign In", onTap: () {
                          Get.toNamed("/signIn");
                    }),
                    SizedBox(
                      height: Get.height * .05,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
