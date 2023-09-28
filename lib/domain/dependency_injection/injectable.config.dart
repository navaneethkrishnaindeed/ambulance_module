// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../application/assign_ambulance_and_driver/bloc/assign_ambulance_with_driver_bloc.dart'
    as _i4;
import '../../application/driver_login_modal/bloc/driver_auth_form_validator_and_custom_keyboard_navigation_manager_bloc.dart'
    as _i7;
import '../../application/home/form_validator_and_custom_keyboard_navigtion_manager_bloc/form_validator_and_custom_keyboard_navigation_manager_bloc.dart'
    as _i8;
import '../../application/splash_screen/splashscreen_bloc.dart' as _i9;
import '../constants/app_strings.dart' as _i5;
import '../constants/asset_paths.dart' as _i3;
import '../DS_Version3/DS_colors/DS_colors.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.AdminModuleAssetPaths>(() => _i3.AdminModuleAssetPaths());
  gh.factory<_i4.AmbulanceSearchModalBloc>(
      () => _i4.AmbulanceSearchModalBloc());
  gh.factory<_i5.AppStrings>(() => _i5.AppStrings());
  gh.factory<_i6.DS_Colors>(() => _i6.DS_Colors());
  gh.factory<_i7.DriverAuthFormValidatorAndCustomKeyboardNavigationManagerBloc>(
      () =>
          _i7.DriverAuthFormValidatorAndCustomKeyboardNavigationManagerBloc());
  gh.factory<_i3.DriverLoginScreenAssetPaths>(
      () => _i3.DriverLoginScreenAssetPaths());
  gh.factory<_i5.DriverLoginScreenStrings>(
      () => _i5.DriverLoginScreenStrings());
  gh.factory<_i8.FormValidatorAndCustomKeyboardNavigationManagerBloc>(
      () => _i8.FormValidatorAndCustomKeyboardNavigationManagerBloc());
  gh.factory<_i5.GeneralKeys>(() => _i5.GeneralKeys());
  gh.factory<_i5.PublicEncryptionKeys>(() => _i5.PublicEncryptionKeys());
  gh.factory<_i3.SplashScreenAssetPaths>(() => _i3.SplashScreenAssetPaths());
  gh.factory<_i5.SplashScreenStrings>(() => _i5.SplashScreenStrings());
  gh.factory<_i9.SplashscreenBloc>(() => _i9.SplashscreenBloc());
  return get;
}
