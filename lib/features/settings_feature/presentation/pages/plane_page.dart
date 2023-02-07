import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn/features/settings_feature/presentation/controller/settings_controller.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/widgets/Costance.dart';

class PlanePage extends StatelessWidget {
  final controller = Get.find<SettingsController>();

  PlanePage({Key? key}) : super(key: key) {
    controller.getPlane();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Obx(() {
          return Column(
            children: [
              SizedBox(
                height: Get.height * .05,
              ),
              buildAppBar(),
              (controller.loading.isFalse)
                  ? Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Lottie.asset("assets/anims/loading.json",
                              width: Get.width * .3),
                        ],
                      ),
                    )
                  : Expanded(
                      child: GridView.builder(
                        itemCount: controller.planeData?.data?.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, mainAxisExtent: 170),
                        itemBuilder: itemBuilder,
                      ),
                    )
            ],
          );
        }),
      ),
    );
  }

  buildAppBar() {
    return SizedBox(
      height: Get.height * .1,
      width: Get.width,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: UiHelper.backIconBtn(),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: Get.height * .03),
              child: const Text(
                "Planes",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(top: Get.height * .03, right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset("assets/images/image 1350 (1).png",
                      width: Get.width * .07),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    "20K",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    final item = controller.planeData?.data?[index];
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          boxShadow: UiHelper.shadow1,
          borderRadius: BorderRadius.circular(30),
          color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              "assets/images/Rectangle 368.png",
              fit: BoxFit.cover,
            ),
            Image.asset(
              "assets/images/Rectangle 369.png",
              fit: BoxFit.cover,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  item!.name.toString().replaceAll("-", " "),
                  style: const TextStyle(color: Colors.white, fontSize: 26),
                ),
                Text(
                  "${item.price.toString().replaceAll("-", " ")}\$",
                  style: const TextStyle(color: Colors.white, fontSize: 24),
                ),
                Text(
                  "${item.tokens.toString()} Tokens",
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
