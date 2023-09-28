import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../application/assign_ambulance_and_driver/bloc/assign_ambulance_with_driver_bloc.dart';
import '../../../application/assign_ambulance_and_driver/value_notifer/value_notifier.dart';
import '../../../domain/DS_Version3/DS_text/DS_text_styles.dart';

import '../../../domain/utils/screen_sizes.dart';

class AmbulanceSearchModal extends StatefulWidget {
  const AmbulanceSearchModal({super.key});

  @override
  State<AmbulanceSearchModal> createState() => _AmbulanceSearchModalState();
}

class _AmbulanceSearchModalState extends State<AmbulanceSearchModal> {
  late final Future<LottieComposition> _composition;

  @override
  void initState() {
    _composition = AssetLottie("assets/images/config_lottie.json").load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildUI(context);
  }

  orientationManagerWidth(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return ScreenSizes(context).screenWidthFraction(percent: 85);
    } else {
      return ScreenSizes(context).screenWidthFraction(percent: 68);
    }
  }

  orientationManagerHeight(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return ScreenSizes(context).screenHeightFraction(percent: 85);
    } else {
      return ScreenSizes(context).screenHeightFraction(percent: 85);
    }
  }

  Dialog _buildUI(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: orientationManagerHeight(context),
        width: orientationManagerWidth(context),
        child: Column(
          children: [
            SizedBox(
              height: ScreenSizes(context).screenHeightFraction(percent: 2),
            ),
            _headder(context),
            _body(context)
          ],
        ),
      ),
    );
  }

  SizedBox _body(BuildContext context) {
    return SizedBox(
      width: ScreenSizes(context).screenWidthFraction(percent: 68),
      height: ScreenSizes(context).screenHeightFraction(percent: 45),
      // color: Colors.red,
      child: Column(
        children: [
          SizedBox(
              height: ScreenSizes(context).screenHeightFraction(percent: 3.3)),
          // _driverID(context),
          SizedBox(
              height: ScreenSizes(context).screenHeightFraction(percent: 3.3)),

          Container(
            // color: Colors.amber,
            height: ScreenSizes(context).screenHeightFraction(percent: 31),
            child: Expanded(
              child: Scrollbar(
                interactive: true,
                thumbVisibility: true,
                radius: const Radius.circular(15),
                trackVisibility: true,
                thickness: 10,
                child: ListView.builder(
                  itemCount: AmbulanceConfigurationValueNotifierListners
                      .Ambulancelimit.value,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        AmbulanceConfigurationValueNotifierListners.selected.value;
                      },
                      child: GestureDetector(
                        child: Container(
                          margin: const EdgeInsets.only(top: 3, bottom: 3),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey.shade400),
                            borderRadius: BorderRadius.circular(9),
                          ),
                          height: 37,
                          child: const Text("KL 40 AD 7878"),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          const Spacer(),
          Container(
            width: ScreenSizes(context).screenWidthFraction(percent: 45),
            height: 40,
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(15)),
          )
        ],
      ),
    );
  }

  Column _headder(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: ScreenSizes(context).relativeHeight(
              parentHeight: orientationManagerHeight(context), percent: 15),
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
          height: ScreenSizes(context).relativeHeight(
              parentHeight: orientationManagerHeight(context), percent: 4.5),
        ),
        Text(
          "Select Ambulance",
          style: DS_Style_QuickSand.params(
              fontSize: 25, fontWeight: FontWeight.w300, letterSpacing: 1.4),
        ),
      ],
    );
  }

  String maskAmount(String amountString, int targetLength) {
    String maskedAmount = '*' * amountString.length;
    return maskedAmount;
  }

  GestureDetector _driverID(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<AmbulanceSearchModalBloc>(context)
            .add(AmbulanceSearchModalEvent.keyboardNavigator(
          label: "Search Key",
          valueNotifier: AmbulanceConfigurationValueNotifierListners.searchKey,
          context: context,
          isObscure: false,
        ));
      },
      child: Container(
          padding: const EdgeInsets.only(left: 17),
          height: 45,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 255, 255, 255)),
          width: ScreenSizes(context).screenWidthFraction(percent: 56),
          child: Row(
            children: [
              const Icon(
                Icons.search,
                size: 18,
              ),
              const SizedBox(
                width: 8,
              ),
              ValueListenableBuilder(
                valueListenable:
                    AmbulanceConfigurationValueNotifierListners.searchKey,
                builder: (context, value, child) {
                  if (value == "") {
                    return const Text("Driver ID");
                  } else {
                    return Text(value);
                  }
                },
              )
            ],
          )),
    );
  }
}
