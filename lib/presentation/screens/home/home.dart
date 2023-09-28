// ignore_for_file: unused_element, no_leading_underscores_for_local_identifiers, non_constant_identifier_names

import 'dart:developer';

import 'package:ambulance_module/domain/DS_Version3/DS_text/DS_text_styles.dart';
import 'package:ambulance_module/domain/constants/asset_paths.dart';
import 'package:ambulance_module/domain/utils/app_util.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../../domain/utils/screen_sizes.dart';

import '../../../application/home/form_validator_and_custom_keyboard_navigtion_manager_bloc/form_validator_and_custom_keyboard_navigation_manager_bloc.dart';
import '../../../application/home/value_notifiers/value_notiifers.dart';
import '../../../domain/routes/routes.dart';
import '../../components/modals/assign_ambulance_and_driver.dart';
import '../../components/modals/driver_login_modal.dart';
import '../../components/modals/patient_details.dart';

final TextEditingController _nameController = TextEditingController();

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final Future<LottieComposition> _composition;
  late final Future<LottieComposition> _compositionSettingIcons;

  Gender selectedGender = Gender.Male;
  bool istaped = false;
  FocusNode focusNode = FocusNode();
  @override
  void initState() {
   
    _compositionSettingIcons =
        AssetLottie(AssetPaths.driverLoginScreenAssetPaths.hamburgerLottie)
            .load();
    _composition =
        AssetLottie(AssetPaths.driverLoginScreenAssetPaths.lottieAnime).load();
    BlocProvider.of<FormValidatorAndCustomKeyboardNavigationManagerBloc>(
            context)
        .add(FormValidatorAndCustomKeyboardNavigationManagerEvent.init(
            context: context));
    log("initstate");

    super.initState();
  }

  @override
  void dispose() {
    BlocProvider.of<FormValidatorAndCustomKeyboardNavigationManagerBloc>(context).close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildUI(context);
  }

  Widget _buildUI(BuildContext context) {
    Widget _responciveManager(BuildContext context) {
      if (MediaQuery.of(context).orientation == Orientation.portrait) {
        return _mobileView(context);
      } else {
        return _tabView(context);
      }
    }

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: _responciveManager(context),
    );
  }

  SafeArea _tabView(BuildContext context) {
    Container _bottomSection(BuildContext context) {
      return Container(
        alignment: Alignment.center,
        // color: Colors.amberAccent,
        width: ScreenSizes(context).screenWidth(),
        height: ScreenSizes(context).screenHeightFraction(percent: 25),
        child: Column(
          children: [
            GestureDetector(
              onTap: () => Navigator.of(context).pushNamed(RoutPaths.maps),
              child: Container(
                margin: const EdgeInsets.only(top: 5),
                height: ScreenSizes(context).screenHeightFraction(percent: 8.2),
                width: ScreenSizes(context).screenWidthFraction(percent: 26),
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10)),
                child: Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.play_arrow,
                        size: 30,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Start Ride",
                        style: DS_Style_QuickSand.params(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(" Ambulance Number : 65DC45TH"),
                      Text(" Driver Number : 4DFDCXXXX45TH"),
                    ],
                  ),
                ),
                const Spacer(),
                const Spacer(),
                Text(
                  "Powered by",
                  style: GoogleFonts.mavenPro(letterSpacing: 1.3),
                ),
                SizedBox(
                    height:
                        ScreenSizes(context).screenHeightFraction(percent: 8),
                    width: ScreenSizes(context).screenWidthFraction(percent: 6),
                    child: Image.asset("assets/images/grapesLogo2.png"))
              ],
            ),
          ],
        ),
      );
    }

    ColoredBox _lottieAnime(BuildContext context) {
      return ColoredBox(
        color:const Color.fromARGB(0, 173, 42, 42),
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  height:
                      ScreenSizes(context).screenHeightFraction(percent: 38),
                  child: FutureBuilder<LottieComposition>(
                    future: _composition,
                    builder: (context, snapshot) {
                      return Lottie(
                        composition: snapshot.data,
                      );
                    },
                  ),
                ),
                SizedBox(
                    height:
                        ScreenSizes(context).screenHeightFraction(percent: 5)),
                SizedBox(
                  // width: ScreenSizes(context).screenWidthFraction(percent: 93),
                  child: Text(
                    AppUtil.appStrings.driverLoginScreenStrings.headder,
                    style: DS_Style_QuickSand.params(
                        fontSize: 28,
                        textColor: Colors.black,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 4.5),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Row _headder() => Row(
          children: [
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) =>AmbulanceSearchModal()
                );
              },
              child: FutureBuilder<LottieComposition>(
                future: _compositionSettingIcons,
                builder: (context, snapshot) {
                  return Lottie(
                    height: 30,
                    composition: snapshot.data,
                  );
                },
              ),
            ),
            const Spacer(),
            SizedBox(
              height: ScreenSizes(context).screenWidthFraction(percent: 5),
              // child: Text("data"),
            ),

           
           
          ],
        );

    return SafeArea(
      child: Container(
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.only(
          left: ScreenSizes(context).screenWidthFraction(percent: 3),
          right: ScreenSizes(context).screenWidthFraction(percent: 3),
        ),
        width: ScreenSizes(context).screenWidth(),
        color: const Color.fromARGB(255, 233, 201, 188),
        child: Column(
          // dragStartBehavior: DragStartBehavior.down,
          children: [
            _headder(),
            _lottieAnime(context),
            const Spacer(),
            _bottomSection(context),
          ],
        ),
      ),
    );
  }

  SafeArea _mobileView(BuildContext context) {
    Container _bottomSection(BuildContext context) {
      return Container(
        alignment: Alignment.center,
        // color: Colors.amberAccent,
        width: ScreenSizes(context).screenWidth(),
        height: ScreenSizes(context).screenHeightFraction(percent: 20),
        child: Column(
          children: [
            GestureDetector(
                 onTap: () => Navigator.of(context).pushNamed(RoutPaths.maps),

              child: Container(
                  height: ScreenSizes(context).screenHeightFraction(percent: 7),
                  width: ScreenSizes(context).screenWidthFraction(percent: 40),
                  decoration: BoxDecoration(
                      color: AppUtil.appColors.button,
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    alignment: Alignment.center,
                    child: Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.play_arrow,
                            size: 30,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Start Ride",
                            style: DS_Style_QuickSand.params(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  )),
            ),

            const Spacer(),

            // color: Colors.amber,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        " Ambulance Number : 65DC45TH",
                        style: const TextStyle(fontSize: 12),
                      ),
                      const Text(" Driver Number : 4DFDCXXXX45TH",
                          style: const TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
                const Spacer(),
                const Spacer(),
                Text(
                  "Powered by",
                  style: GoogleFonts.mavenPro(letterSpacing: 1.3, fontSize: 12),
                ),
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                    height:
                        ScreenSizes(context).screenHeightFraction(percent: 8),
                    width:
                        ScreenSizes(context).screenWidthFraction(percent: 10),
                    child: Image.asset("assets/images/grapesLogo2.png"))
              ],
            ),
          ],
        ),
      );
    }

    ColoredBox _lottieAnime(BuildContext context) {
      return ColoredBox(
        color: Color.fromARGB(0, 173, 42, 42),
        child: Column(
          children: [
            Column(
              children: [
                SizedBox(
                  height:
                      ScreenSizes(context).screenHeightFraction(percent: 38),
                  child: FutureBuilder<LottieComposition>(
                    future: _composition,
                    builder: (context, snapshot) {
                      return Lottie(
                        composition: snapshot.data,
                      );
                    },
                  ),
                ),
                SizedBox(
                    height:
                        ScreenSizes(context).screenHeightFraction(percent: 5)),
                SizedBox(
                  // width: ScreenSizes(context).screenWidthFraction(percent: 93),
                  child: Text(
                    AppUtil.appStrings.driverLoginScreenStrings.headder,
                    style: DS_Style_QuickSand.params(
                        fontSize: 24,
                        textColor: Colors.black,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 4),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Row _headder() => Row(
          children: [
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AmbulanceSearchModal()
                );
              },
              child: FutureBuilder<LottieComposition>(
                future: _compositionSettingIcons,
                builder: (context, snapshot) {
                  return Lottie(
                    height: 30,
                    composition: snapshot.data,
                  );
                },
              ),
            ),
            const Spacer(),
            SizedBox(
              height: ScreenSizes(context).screenWidthFraction(percent: 15),
            ),

            // Container(
            //   alignment: Alignment.center,
            //   margin: const EdgeInsets.only(right: 15),
            //   decoration: BoxDecoration(
            //     color: AppUtil.appColors.button,
            //     borderRadius: BorderRadius.circular(7),
            //   ),
            //   width: ScreenSizes(context).screenWidthFraction(percent: 7.7),
            //   height: ScreenSizes(context).screenWidthFraction(percent: 3),
            //   child: Text(
            //     AppUtil.appStrings.driverLoginScreenStrings.login,
            //     style: DS_Style_QuickSand.params(
            //         fontSize: 14,
            //         textColor: Colors.black,
            //         fontWeight: FontWeight.w700),
            //   ),
            // ),
            // GestureDetector(
            //   onTap: () => print("kgouuhilugligi"),
            //   child: FutureBuilder<LottieComposition>(
            //     future: _compositionHamburgerIcons,
            //     builder: (context, snapshot) {
            //       return Lottie(
            //         height: 30,
            //         composition: snapshot.data,
            //       );
            //     },
            //   ),
            // )
          ],
        );

    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(
          left: ScreenSizes(context).screenWidthFraction(percent: 3),
          right: ScreenSizes(context).screenWidthFraction(percent: 3),
        ),
        height: ScreenSizes(context).screenHeight(),
        width: ScreenSizes(context).screenWidth(),
        color: const Color.fromARGB(255, 233, 201, 188),
        child: Column(
          // dragStartBehavior: DragStartBehavior.down,
          children: [
            _headder(),
            const Spacer(),
            _lottieAnime(context),
            const Spacer(),
            _bottomSection(context),
          ],
        ),
      ),
    );
  }
}




// class FromAndTo extends StatelessWidget {
//   double parentHeight;
//   double parentWidth;
//   FromAndTo({super.key, required this.parentHeight, required this.parentWidth});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         SizedBox(
//             width: ScreenSizes(context)
//                 .relativeWidth(parentWidth: parentWidth, percent: 10),
//             height: ScreenSizes(context)
//                 .relativeHeight(parentHeight: parentHeight, percent: 80),
//             child: const Icon(Icons.search)),
//         InkWell(
//           onTap: () {
//             log("message");
//             BlocProvider.of<
//                         FormValidatorAndCustomKeyboardNavigationManagerBloc>(
//                     context)
//                 .add(FormValidatorAndCustomKeyboardNavigationManagerEvent
//                     .navigateToKeyBoard(
//                         label: "From",
//                         valueNotifier: MapsFromTo.from,
//                         context: context,
//                         isObscure: false));
//           },
//           child: Container(
//               alignment: Alignment.centerLeft,
//               padding: const EdgeInsets.only(left: 12, right: 7),
//               width: ScreenSizes(context)
//                   .relativeWidth(parentWidth: parentWidth, percent: 35),
//               height: ScreenSizes(context).screenHeightFraction(percent: 4),
//               decoration: BoxDecoration(
//                   border: Border.all(width: 1.5),
//                   borderRadius: BorderRadius.circular(9)),
//               child: ValueListenableBuilder(
//                 valueListenable: MapsFromTo.from,
//                 builder: (context, value, child) {
//                   if (value == "") {
//                     return const Text("From");
//                   } else {
//                     return Text(
//                       value,
//                       style: DS_Style_QuickSand.params(),
//                     );
//                   }
//                 },
//               )),
//         ),
//         SizedBox(
//             width: ScreenSizes(context).relativeWidth(
//           parentWidth: parentWidth,
//           percent: 2.5,
//         )),
//         InkWell(
//           onTap: () {
//             BlocProvider.of<
//                         FormValidatorAndCustomKeyboardNavigationManagerBloc>(
//                     context)
//                 .add(FormValidatorAndCustomKeyboardNavigationManagerEvent
//                     .navigateToKeyBoard(
//                         label: "To",
//                         valueNotifier: MapsFromTo.to,
//                         context: context,
//                         isObscure: false));
//           },
//           child: Container(
//               alignment: Alignment.centerLeft,
//               padding: const EdgeInsets.only(left: 12, right: 7),
//               width: ScreenSizes(context)
//                   .relativeWidth(parentWidth: parentWidth, percent: 35),
//               height: ScreenSizes(context).screenHeightFraction(percent: 4),
//               decoration: BoxDecoration(
//                   border: Border.all(width: 1.5),
//                   borderRadius: BorderRadius.circular(9)),
//               child: ValueListenableBuilder(
//                 valueListenable: MapsFromTo.to,
//                 builder: (context, value, child) {
//                   if (value == "") {
//                     return const Text("To");
//                   } else {
//                     return Text(
//                       value,
//                       style: DS_Style_QuickSand.params(),
//                     );
//                   }
//                 },
//               )),
//         ),
//         const Spacer(),
//         InkWell(
//           onTap: () {
//             //   showDialog(
//             //   context: context,
//             //   builder: (context) => PatientDetails(),
//             // );

//             if (MapsFromTo.from.value != '' && MapsFromTo.to.value != '') {
//               Navigator.of(context).pushNamed(RoutPaths.maps);
//             }
//           },
//           child: Container(
//             alignment: Alignment.center,
//             height: ScreenSizes(context).screenHeightFraction(percent: 4),
//             width: ScreenSizes(context)
//                 .relativeWidth(parentWidth: parentWidth, percent: 10),
//             decoration: BoxDecoration(
//                 color: const Color.fromARGB(255, 51, 51, 51),
//                 borderRadius: BorderRadius.circular(6)),
//             child: Text(
//               "Go",
//               style: DS_Style_QuickSand.params(
//                 textColor: Colors.white,
//                 fontWeight: FontWeight.w600,
//               ),
//               textAlign: TextAlign.justify,
//             ),
//           ),
//         ),
//         const Spacer(),
//       ],
//     );
//   }
// }
