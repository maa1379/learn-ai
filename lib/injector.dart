import 'package:get_it/get_it.dart';
import 'package:learn/features/home_feature/data/repositories/category_repositoryimpl.dart';
import 'package:learn/features/home_feature/data/repositories/slider_repositoryimpl.dart';
import 'package:learn/features/home_feature/domain/repositories/slider_repository.dart';
import 'package:learn/features/home_feature/domain/use_cases/category_usecase.dart';
import 'package:learn/features/home_feature/domain/use_cases/slider_usecase.dart';
import 'package:learn/features/settings_feature/data/repositories/plase_repositoryimpl.dart';
import 'package:learn/features/settings_feature/data/repositories/profile_repositoryimpl.dart';
import 'package:learn/features/settings_feature/domain/repositories/profile_repository.dart';
import 'package:learn/features/settings_feature/domain/use_cases/plane_usecase.dart';
import 'package:learn/features/settings_feature/domain/use_cases/profile_usecase.dart';

import 'features/home_feature/domain/repositories/category_repository.dart';
import 'features/register_login_feature/data/data_sources/sign_up_api.dart'
    as sign;
import 'features/home_feature/data/data_sources/category_api.dart' as category;
import 'features/settings_feature/data/data_sources/settings_api.dart'
    as settings;
import 'features/register_login_feature/data/repositories/sign_up_repoImpl.dart';
import 'features/register_login_feature/domain/repositories/sign_repository.dart';
import 'features/register_login_feature/domain/use_cases/sign_user_usecase.dart';
import 'features/settings_feature/domain/repositories/plane_repository.dart';

GetIt locator = GetIt.instance;

setUp() async {
  //sign
  locator.registerSingleton<sign.ApiProvider>(sign.ApiProvider());
  locator.registerSingleton<SignRepository>(SignUpRepoImpl(locator()));
  locator.registerSingleton<SignUpUserUseCase>(SignUpUserUseCase(locator()));
  locator.registerSingleton<SignInUserUseCase>(SignInUserUseCase(locator()));

  //category
  locator.registerSingleton<category.ApiProvider>(category.ApiProvider());
  locator
      .registerSingleton<CategoryRepository>(CategoryRepositoryImpl(locator()));
  locator.registerSingleton<CategoryUseCase>(CategoryUseCase(locator()));

  //slider
  locator.registerSingleton<SliderRepository>(SliderRepositoryImpl(locator()));
  locator.registerSingleton<SliderUseCase>(SliderUseCase(locator()));

  //plane
  locator.registerSingleton<settings.ApiProvider>(settings.ApiProvider());
  locator.registerSingleton<PlaneRepository>(PlaneRepositoryImpl(locator()));
  locator.registerSingleton<PlaneUseCase>(PlaneUseCase(locator()));

  //profile
  locator
      .registerSingleton<ProfileRepository>(ProfileRepositoryImpl(locator()));
  locator.registerSingleton<ProfileUseCase>(ProfileUseCase(locator()));
}
