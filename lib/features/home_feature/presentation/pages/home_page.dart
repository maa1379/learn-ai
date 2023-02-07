import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn/core/widgets/Costance.dart';
import 'package:learn/features/home_feature/presentation/controllers/home_controller.dart';
import 'package:learn/features/settings_feature/presentation/pages/peofile_page.dart';
import 'package:learn/injector.dart';
import 'package:lottie/lottie.dart';

import '../../../settings_feature/presentation/pages/settings_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final controller = Get.put(HomeController(locator(), locator()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        height: Get.height * .07,
        width: Get.width * .15,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(20)),
        child: IconButton(
          icon: const Icon(
            Icons.home_outlined,
            color: Colors.white,
            size: 35,
          ),
          onPressed: () {
            controller.activePage.value = 2;
            controller.update();
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: buildNavBar(),
      body: Obx(() {
        return SizedBox(
          height: Get.height,
          width: Get.width,
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: controller.pageController,
            onPageChanged: (page) {
              controller.activePage.value = page;
              controller.update();
            },
            children: [
              (controller.activePage.value == 2)
                  ? home()
                  : ProfilePage(isMain: true),
              (controller.activePage.value == 2) ? home() : SettingPage(),
            ],
          ),
        );
      }),
    );
  }

  buildAppBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width * .05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: Get.height * .05,
            width: Get.width * .5,
            child: const Text(
              "Learn Ai",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          GestureDetector(
            onTap: () {
              controller.activePage.value = 0;
              controller.pageController.jumpToPage(0);
              controller.update();
            },
            child: Container(
              margin: EdgeInsets.only(left: Get.width * .06, top: 15),
              height: Get.height * .06,
              width: Get.width * .13,
              decoration: BoxDecoration(
                borderRadius: UiHelper.borderRadius16,
                border: Border.all(
                  color: ColorsHelper.lightGray,
                  width: 2,
                ),
                color: Colors.transparent,
              ),
              child: Center(
                child: Icon(
                  Icons.person_outline,
                  color: ColorsHelper.darkGray,
                  size: Get.width * .07,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  buildSlider() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      height: Get.height * .22,
      width: Get.width,
      decoration: BoxDecoration(
          color: Colors.transparent, borderRadius: UiHelper.borderRadius25),
      child: Column(
        children: [
          Expanded(
            child: Swiper(
              pagination: const SwiperPagination(
                alignment: Alignment.bottomCenter,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Expanded(
                      child: (index == 0)
                          ? Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: UiHelper.borderRadius25,
                                image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image:
                                      AssetImage("assets/images/Group 356.png"),
                                ),
                              ),
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Positioned.fill(
                                    bottom: 40,
                                    left: Get.width * .36,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Image.asset(
                                              "assets/images/image 1350 (1).png",
                                              width: Get.width * .07,
                                            ),
                                            const Text(
                                              "20K",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 22),
                                            ),
                                          ],
                                        ),
                                        const Text(
                                          "Invite Friends to earn coins",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 16),
                                        ),
                                        Container(
                                          height: Get.height * .04,
                                          width: Get.width * .2,
                                          margin:
                                              const EdgeInsets.only(top: 20),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                UiHelper.borderRadius16,
                                            color: Colors.white,
                                            boxShadow: UiHelper.shadow1,
                                          ),
                                          child: const Center(
                                            child: Text("Continue"),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: UiHelper.borderRadius25,
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                    controller.sliderData!.data![index].image
                                        .toString(),
                                  ),
                                ),
                              ),
                            ),
                    ),
                  ],
                );
              },
              itemCount: controller.sliderData!.data!.length,
              itemWidth: 380.0,
              layout: SwiperLayout.STACK,
            ),
          ),
        ],
      ),
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    final item = controller.dataState?.data?[index];
    return GestureDetector(
      onTap: (){
        Get.toNamed("/question");
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Color(int.parse("0xff${item?.color!.split("#")[1]}")),
                BlendMode.color),
            fit: BoxFit.cover,
            image: NetworkImage(item!.image.toString()),
          ),
          boxShadow: UiHelper.shadow1,
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
        ),
        child: Center(
          child: Text(
            item.name.toString(),
            style: const TextStyle(color: Colors.white, fontSize: 26),
          ),
        ),
      ),
    );
  }

  buildNavBar() {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return AnimatedBottomNavigationBar(
          icons: const [
            Icons.person_outline,
            Icons.settings_outlined,
          ],
          iconSize: 28,
          activeColor: ColorsHelper.blue,
          shadow: Shadow(color: Colors.grey.withOpacity(0.3), blurRadius: 12),
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.softEdge,
          backgroundColor: Colors.white,
          activeIndex: controller.activePage.value,
          onTap: (index) {
            controller.activePage.value = index;
            controller.pageController.jumpToPage(controller.activePage.value);
            controller.update();
          },
        );
      },
    );
  }

  home() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Get.width * .01),
      height: Get.height,
      width: Get.width,
      child: GetBuilder<HomeController>(builder: (controller) {
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(height: Get.height * .06),
                  buildAppBar(),
                  (controller.sliderLoading.isFalse)
                      ? Center(
                          child: Lottie.asset(
                            "assets/anims/loading.json",
                            width: Get.width * .3,
                          ),
                        )
                      : buildSlider(),
                  SizedBox(height: Get.height * .03),
                  Padding(
                    padding: EdgeInsets.only(left: Get.width * .02, bottom: 10),
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Subject",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                  )
                ],
              ),
            ),
            (controller.loading.isFalse)
                ? SliverToBoxAdapter(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: Get.height * .15,
                        ),
                        Lottie.asset(
                          "assets/anims/loading.json",
                          width: Get.width * .3,
                        ),
                      ],
                    ),
                  )
                : SliverGrid(
                    delegate: SliverChildBuilderDelegate(itemBuilder,
                        childCount: controller.dataState?.data?.length),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 160,
                    ),
                  ),
          ],
        );
      }),
    );
  }
}
