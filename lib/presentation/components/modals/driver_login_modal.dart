import 'dart:developer';

import 'package:ambulance_module/domain/DS_Version3/DS_text/DS_text_styles.dart';
import 'package:ambulance_module/domain/routes/routes.dart';
import 'package:ambulance_module/domain/utils/screen_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../application/driver_login_modal/bloc/driver_auth_form_validator_and_custom_keyboard_navigation_manager_bloc.dart';
import '../../../application/driver_login_modal/value_notifiers/value_notifiers.dart';
import '../../../domain/constants/asset_paths.dart';
import '../../../domain/utils/app_util.dart';
import '../../../infrastructure/global_database/apis/auth/driver_login_repo/i_repo.dart';
import 'assign_ambulance_and_driver.dart';

class DriverLoginModal extends StatefulWidget {
  final bool isPassword;
  const DriverLoginModal({super.key, required this.isPassword});

  @override
  State<DriverLoginModal> createState() => _DriverLoginModalState();
}

class _DriverLoginModalState extends State<DriverLoginModal> {
  late final Future<LottieComposition> _composition;

  @override
  void initState() {
    BlocProvider.of<
                DriverAuthFormValidatorAndCustomKeyboardNavigationManagerBloc>(
            context)
        .add(const DriverAuthFormValidatorAndCustomKeyboardNavigationManagerEvent
            .started());
    _composition =
        AssetLottie(AssetPaths.adminModuleAssetPaths.driverLottie).load();
    super.initState();
  }

  @override
  void dispose() {
    DriverLoginModalValueLisnableBuilders.username.value = "";
    log("dispos");

    super.dispose();
  }

  bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.longestSide >= 900;
  }

  orientationManagerWidth(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return ScreenSizes(context).screenWidthFraction(percent: 90);
    } else {
      return ScreenSizes(context).screenWidthFraction(percent: 68);
    }
  }

  orientationManagerHeight(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return ScreenSizes(context).screenHeightFraction(percent: 60);
    } else {
      return ScreenSizes(context).screenHeightFraction(percent: 90);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetAnimationCurve: Curves.bounceInOut,
      insetAnimationDuration: const Duration(seconds: 3),
      child: SizedBox(
        height: orientationManagerHeight(context),
        width: orientationManagerWidth(context),
        child: Column(
          children: [
            SizedBox(
              height: ScreenSizes(context).screenHeightFraction(percent: 2),
            ),
            Expanded(
              child: SizedBox(
                // width: ScreenSizes(context).screenWidthFraction(percent: 18),
                height: ScreenSizes(context).screenHeightFraction(percent: 28),
                child: FutureBuilder<LottieComposition>(
                  future: _composition,
                  builder: (context, snapshot) {
                    return Lottie(
                      composition: snapshot.data,
                    );
                  },
                ),
              ),
            ),
            Text(
              "Driver Login",
              style: DS_Style_QuickSand.params(
                  fontSize: 25,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 1.4),
            ),
            SizedBox(
              width: ScreenSizes(context).screenWidthFraction(percent: 68),
              // height: ScreenSizes(context).screenHeightFraction(percent: 35),
              // color: Colors.red,
              child: Column(
                children: [
                  SizedBox(
                      height: ScreenSizes(context)
                          .screenHeightFraction(percent: 3.3)),
                  _userName(context),
                  SizedBox(
                      height: ScreenSizes(context)
                          .screenHeightFraction(percent: 3.3)),
                  widget.isPassword ? _passWord(context) : _pin(context),
                  _submitButton(context)
                ],
              ),
            ),
            SizedBox(
              height: ScreenSizes(context).screenHeightFraction(percent: 10),
            )
          ],
        ),
      ),
    );
  }

  GestureDetector _submitButton(BuildContext context) {
    return GestureDetector(
      onTap: ()async  {
          BlocProvider.of<DriverAuthFormValidatorAndCustomKeyboardNavigationManagerBloc>(context)
        .add(DriverAuthFormValidatorAndCustomKeyboardNavigationManagerEvent.login(context: context));
      },
      child: Container(
        alignment: Alignment.center,
        width: ScreenSizes(context).relativeWidth(
            parentWidth: orientationManagerWidth(context), percent: 75),
        height: ScreenSizes(context).relativeHeight(
            parentHeight: orientationManagerHeight(context), percent: 9),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppUtil.appColors.button),
        margin: const EdgeInsets.only(top: 25),
        child: const Text("Submit"),
      ),
    );
  }

  String maskAmount(String amountString, int targetLength) {
    String maskedAmount = '*' * amountString.length;
    return maskedAmount;
  }

  GestureDetector _pin(BuildContext context) {
    return GestureDetector(
      onTap: () => BlocProvider.of<
                  DriverAuthFormValidatorAndCustomKeyboardNavigationManagerBloc>(
              context)
          .add(DriverAuthFormValidatorAndCustomKeyboardNavigationManagerEvent
              .numPadNavigator(
                  context: context,
                  isFinite: true,
                  isObsure: true,
                  isPhone: false,
                  limit: 6,
                  label: "PIN",
                  valueNotifier: DriverLoginModalValueLisnableBuilders.pin)),
      child: Container(
          padding: const EdgeInsets.only(left: 17),
          height: 57,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.grey[200]),
          width: ScreenSizes(context).relativeWidth(
              parentWidth: orientationManagerWidth(context), percent: 80),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 9),
                alignment: Alignment.center,
                height: 57,
                width: 30,
                child: Icon(Icons.lock, size: isTablet(context) ? null : 17),
              ),
              ValueListenableBuilder(
                valueListenable: DriverLoginModalValueLisnableBuilders.pin,
                builder: (context, value, child) {
                  if (value == "") {
                    return const Text("PIN");
                  } else {
                    return Text(maskAmount(value, 6));
                  }
                },
              )
            ],
          )),
    );
  }

  GestureDetector _passWord(BuildContext context) {
    return GestureDetector(
      onTap: () => BlocProvider.of<
                  DriverAuthFormValidatorAndCustomKeyboardNavigationManagerBloc>(
              context)
          .add(DriverAuthFormValidatorAndCustomKeyboardNavigationManagerEvent
              .keyboardNavigator(
                  label: "Password",
                  valueNotifier:DriverLoginModalValueLisnableBuilders.password,
                  context: context,
                  isObscure: true)),
      child: Container(
          padding: const EdgeInsets.only(left: 17),
          height: 57,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.grey[200]),
          width: ScreenSizes(context).relativeWidth(
              parentWidth: orientationManagerWidth(context), percent: 80),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 9),
                alignment: Alignment.center,
                height: 57,
                width: 30,
                child: Icon(Icons.lock, size: isTablet(context) ? null : 17),
              ),
              ValueListenableBuilder(
                valueListenable: DriverLoginModalValueLisnableBuilders.password,
                builder: (context, value, child) {
                  if (value == "") {
                    return const Text("Password");
                  } else {
                    return Text(maskAmount(value, 6));
                  }
                },
              ),
            ],
          )),
    );
  }

  GestureDetector _userName(BuildContext context) {
    return GestureDetector(
      onTap: () => BlocProvider.of<
                  DriverAuthFormValidatorAndCustomKeyboardNavigationManagerBloc>(
              context)
          .add(DriverAuthFormValidatorAndCustomKeyboardNavigationManagerEvent
              .numPadNavigator(
                  isObsure: false,
                  limit: 10,
                  label: "Phone Number",
                  valueNotifier: DriverLoginModalValueLisnableBuilders.username,
                  context: context,
                  isFinite: true,
                  isPhone: true)),
      child: Container(
          padding: const EdgeInsets.only(left: 10),
          height: 57,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.grey[200]),
          width: ScreenSizes(context).relativeWidth(
              parentWidth: orientationManagerWidth(context), percent: 80),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 9),
                alignment: Alignment.center,
                height: 57,
                width: 30,
                child: Icon(
                  Icons.call,
                  size: isTablet(context) ? null : 17,
                ),
              ),
              ValueListenableBuilder(
                valueListenable: DriverLoginModalValueLisnableBuilders.username,
                builder: (context, value, child) {
                  if (value == "") {
                    return const Text("Phone Number");
                  } else {
                    return Text(
                      value,
                      style: DS_Style_QuickSand.params(fontSize: 16),
                    );
                  }
                },
              )
            ],
          )),
    );
  }
}
