import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn/features/settings_feature/presentation/controller/settings_controller.dart';
import 'package:lottie/lottie.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../core/widgets/Costance.dart';
import '../../../../injector.dart';

class ProfilePage extends StatelessWidget {
  final controller = Get.put(SettingsController(locator(), locator()));

  ProfilePage({Key? key, required this.isMain}) : super(key: key) {
    controller.getProfile();
  }

  bool isMain = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/Signup and Sign in.png"),
          ),
        ),
        child: Obx(() {
          if (controller.loadingProfile.isFalse) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset("assets/anims/loading.json",
                    width: Get.width * .3),
              ],
            );
          }
          return ListView(
            shrinkWrap: true,
            children: [
              buildAppBar(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: Get.height * .05,
                    width: Get.width * .7,
                    child: Center(
                      child: Text(
                        controller.profileData!.data!.email.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 18),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: ColorsHelper.darkGray.withOpacity(0.4),
                    radius: 50,
                    child: const Center(
                      child: Icon(
                        Icons.person_outline,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * .05,
              ),
              buildCard(),
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
          (isMain)
              ? const SizedBox()
              : Align(
                  alignment: Alignment.topLeft,
                  child: UiHelper.backIconBtn(),
                ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: Get.height * .03),
              child: Text(
                controller.profileData!.data!.email.toString().split("@")[0],
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  buildCard() {
    return Container(
      height: Get.height * .25,
      width: Get.width,
      margin: EdgeInsets.symmetric(horizontal: Get.width * .05),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: UiHelper.shadow1,
        borderRadius: UiHelper.borderRadius25,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Image.asset("assets/images/Group 2251.png"),
                      Text(
                        " ${controller.profileData!.data!.tokens}K",
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  const Text(
                    "All Coins",
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 15),
                height: Get.height * .1,
                width: 1,
                color: Colors.grey.shade300,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Image.asset("assets/images/Group 2251.png"),
                      const Text(
                        "0",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  const Text(
                    "earned by Inviting",
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          const Text(
            "Invite 10 more people to earn 1000 coins",
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 10),
          UiHelper.borderBtnHelper(
              onTap: () async {
                final box = Get.context!.findRenderObject() as RenderBox?;
                await Share.share(
                  "Invite Code: ${controller.profileData!.data!.inviteesCount}",
                  subject: "",
                  sharePositionOrigin:
                      box!.localToGlobal(Offset.zero) & box.size,
                );
              },
              text: "Invite"),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
