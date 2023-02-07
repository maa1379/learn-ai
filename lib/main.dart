import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:learn/core/widgets/Costance.dart';
import 'package:learn/features/settings_feature/presentation/pages/peofile_page.dart';
import 'package:learn/injector.dart';

import 'Bindings/BindingsController.dart';
import 'features/home_feature/presentation/pages/home_page.dart';
import 'features/home_feature/presentation/pages/questions_page.dart';
import 'features/register_login_feature/presentation/pages/register_login_page.dart';
import 'features/register_login_feature/presentation/pages/signin_page.dart';
import 'features/register_login_feature/presentation/pages/singup_page.dart';
import 'features/settings_feature/presentation/pages/plane_page.dart';
import 'features/settings_feature/presentation/pages/settings_page.dart';
import 'features/splash_feature/presentation/pages/splash_page.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp();
  await setUp();
  runApp(
    GetMaterialApp(
      getPages: [
        GetPage(
          name: "/",
          page: () => SplashPage(),
        ),
        GetPage(
          name: "/registerAndLogin",
          page: () => const RegisterAndLoginPage(),
        ),
        GetPage(
          name: "/signIn",
          page: () => SignInPage(),
        ),
        GetPage(
          name: "/signUp",
          page: () => SignUpPage(),
        ),
        GetPage(
          name: "/home",
          page: () => HomePage(),
        ),
        GetPage(
          name: "/settings",
          page: () => SettingPage(),
        ),
        GetPage(
          name: "/profile",
          page: () => ProfilePage(isMain: false),
        ),
        GetPage(
          name: "/plane",
          page: () => PlanePage(),
        ),
        GetPage(
          name: "/question",
          page: () => QuestionsPage(),
        ),
      ],
      debugShowCheckedModeBanner: false,
      initialBinding: BindingsController(),
      theme: ThemeHelper.getTheme(),
      initialRoute: "/",
      // home: SplashPage(),
    ),
  );
}
