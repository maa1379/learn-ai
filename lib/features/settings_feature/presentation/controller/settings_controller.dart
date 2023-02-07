import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn/core/usecase/use_case.dart';
import 'package:learn/core/widgets/Costance.dart';
import 'package:learn/features/settings_feature/domain/entities/plane_entities.dart';
import 'package:learn/features/settings_feature/domain/entities/profile_entities.dart';
import 'package:learn/features/settings_feature/domain/use_cases/plane_usecase.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../core/network/DataState.dart';
import '../../../../core/params/Params.dart';
import '../../domain/use_cases/profile_usecase.dart';

class SettingsController extends GetxController {
  PlaneUseCase planeUseCase;
  ProfileUseCase profileUseCase;

  SettingsController(this.planeUseCase, this.profileUseCase);

  RxList<SettingParams> settingsList = <SettingParams>[
    SettingParams(
      onTap: () {
        Get.toNamed("/profile");
      },
      id: 1,
      name: "Accounts",
      image: "assets/images/security-user.png",
    ),
    SettingParams(
      id: 2,
      name: "Language",
      image: "assets/images/global.png",
      onTap: () {},
    ),
    SettingParams(
      id: 3,
      name: "Reset password",
      image: "assets/images/key.png",
      onTap: () {
        ViewHelper.showErrorDialog("Not Found");
      },
    ),
    SettingParams(
      id: 4,
      name: "Invite Friends",
      image: "assets/images/Group 1.png",
      onTap: () async {
        final box = Get.context!.findRenderObject() as RenderBox?;
        await Share.share(
          "ghdf",
          subject: "",
          sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
        );
      },
    ),
    SettingParams(
      id: 5,
      name: "Plans",
      image: "assets/images/Group 38 (1).png",
      onTap: () {
        Get.toNamed("/plane");
      },
    ),
    SettingParams(
      id: 6,
      name: "Sign out",
      image: "assets/images/logout.png",
      onTap: () {},
    ),
  ].obs;

  DataState<List<PlaneEntities>>? planeData;
  DataState<ProfileEntities>? profileData;
  RxBool loading = false.obs;
  RxBool loadingProfile = false.obs;

  getPlane() async {
    planeData = await planeUseCase(NoParams());
    if (planeData is DataSuccess) {
      loading.value = true;
      update();
    } else {
      loading.value = false;
      update();
    }
  }

  getProfile() async {
    profileData = await profileUseCase(NoParams());
    if (profileData is DataSuccess) {
      loadingProfile.value = true;
      update();
    } else {
      loadingProfile.value = false;
      update();
    }
  }
}
