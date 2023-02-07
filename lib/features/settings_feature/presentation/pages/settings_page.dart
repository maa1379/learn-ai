import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn/core/widgets/Costance.dart';

import '../../../../injector.dart';
import '../controller/settings_controller.dart';

class SettingPage extends StatelessWidget {
  SettingPage({Key? key}) : super(key: key);

  final controller = Get.put(SettingsController(locator(), locator()));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: Get.height,
          width: Get.width,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildAppBar(),
                    SizedBox(height: Get.height * .05),
                    buildListItem()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildAppBar() {
    return Stack(
      alignment: Alignment.center,
      children: const [
        Align(
          alignment: Alignment.centerLeft,
          child: SizedBox(
            height: 80,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            "Settings",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ),
      ],
    );
  }

  buildListItem() {
    return Column(
      children: controller.settingsList
          .map(
            (element) => GestureDetector(
              onTap: () {
                element.onTap!();
              },
              child: Container(
                height: Get.height * .06,
                width: Get.width,
                decoration: BoxDecoration(
                    color: element.id == 6 ? Colors.transparent : Colors.white,
                    borderRadius: UiHelper.borderRadius16,
                    boxShadow: element.id == 6 ? [] : UiHelper.shadow1,
                    border: element.id == 6
                        ? Border.all(color: ColorsHelper.red, width: 1)
                        : const Border()),
                margin: EdgeInsets.symmetric(
                    horizontal: Get.width * .05, vertical: 8),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 15,
                        ),
                        Image.asset(
                          element.image!,
                          width: element.id != 1
                              ? Get.width * .08
                              : Get.width * .08,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          element.name!,
                          style: TextStyle(
                            color: (element.id == 6)
                                ? ColorsHelper.red
                                : Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    (element.id == 6)
                        ? const SizedBox()
                        : Padding(
                            padding: const EdgeInsets.only(right: 25),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: Colors.grey.shade400,
                                size: 20,
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
