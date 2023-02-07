import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/widgets/Costance.dart';
import '../controller/SplashController.dart';

class SplashPage extends StatelessWidget {
  final controller = Get.find<SplashController>();

  SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Obx(() {
            return Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  "assets/images/Signup and Sign in.png",
                  fit: BoxFit.fill,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: Get.height * .1),
                    child: Image.asset(
                      "assets/images/Group 2269 (1).png",
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CarouselSlider.builder(
                    itemCount: 3,
                    itemBuilder: itemBuilder,
                    carouselController: controller.pageController,
                    options: CarouselOptions(
                        onPageChanged: (page, i) {
                          controller.activeIndex.value = page;
                        },
                        viewportFraction: 0.75,
                        animateToClosest: true,
                        aspectRatio: 16 / 9,
                        enlargeCenterPage: true,
                        height: Get.height * .4),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AnimatedSmoothIndicator(
                        activeIndex: controller.activeIndex.value,
                        count: 3,
                        effect: ExpandingDotsEffect(
                            activeDotColor: ColorsHelper.blue,
                            dotColor: Colors.grey.shade400,
                            dotHeight: 10,
                            dotWidth: 10),
                      ),
                      SizedBox(
                        height: Get.height * .01,
                      ),
                      UiHelper.btnHelper(
                          width: Get.width * .2,
                          onTap: () {
                            if (controller.activeIndex.value != 2) {
                              controller.pageController
                                  .nextPage(duration: 500.milliseconds);
                            } else {
                              Get.offAllNamed("/registerAndLogin");
                            }
                          }),
                      SizedBox(
                        height: Get.height * .1,
                      ),
                    ],
                  ),
                )
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget itemBuilder(BuildContext context, int index, int realIndex) {
    return Container(
      width: Get.width * .75,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: UiHelper.shadow1,
        borderRadius: UiHelper.borderRadius25,
      ),
      margin: const EdgeInsets.only(bottom: 30),
      child: Shimmer.fromColors(
        baseColor: Colors.black,
        highlightColor: Colors.grey,
        child: Column(
          children: [
            SizedBox(
              height: Get.height * .08,
            ),
            Text(
              "Welcome to Learn AI".tr,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 35, vertical: 20),
              child: Text(
                "you can solve anyhtingyou can solve anyhtingyou",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 18),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
