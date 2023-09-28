import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../application/home/form_validator_and_custom_keyboard_navigtion_manager_bloc/form_validator_and_custom_keyboard_navigation_manager_bloc.dart';
import '../../../application/home/value_notifiers/value_notiifers.dart';
import '../../../domain/DS_Version3/DS_text/DS_text_styles.dart';
import '../../../domain/utils/app_util.dart';
import '../../../domain/utils/screen_sizes.dart';

 InkWell patient_ID({required BuildContext context,required double parentWidth,required double parentHeight}) {
    return InkWell(
      onTap: () =>
          BlocProvider.of<FormValidatorAndCustomKeyboardNavigationManagerBloc>(
                  context)
              .add(FormValidatorAndCustomKeyboardNavigationManagerEvent
                  .navigateToNumPad(
                      isObsure: false,
                      isFinite: true,
                      limit: 7,
                      label: "Patient ID",
                      valueNotifier: PatientDetailsValueListnerBuilders.P_ID,
                      context: context)),
      child: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 12, right: 7),
        margin: const EdgeInsets.only(left: 10),
        width: ScreenSizes(context).relativeWidth(parentWidth: parentWidth, percent: 82),
        height: ScreenSizes(context).relativeHeight(parentHeight: parentHeight, percent: 8),
        decoration: BoxDecoration(
          border: Border.all(
            width: 0.7,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Text(
              "Patient ID : ",
              style: DS_Style_QuickSand.params(
                  textColor: Colors.black, fontSize: 12),
            ),
            ValueListenableBuilder(
              valueListenable: PatientDetailsValueListnerBuilders.P_ID,
              builder: (context, value, child) {
                return Text(
                  value,
                  style: DS_Style_QuickSand.params(
                      textColor: Colors.black, fontSize: 12),
                );
              },
            )
          ],
        ),
      ),
    );
  }


class PatientDetails extends StatefulWidget {
  const PatientDetails({super.key});

  @override
  State<PatientDetails> createState() => _PatientDetailsState();
}

class _PatientDetailsState extends State<PatientDetails> {
  @override
  Widget build(BuildContext context) {
    var s=isTablet(context);
    log("$s");

    return _patientDetails(context);
  }
}


orientationManagerWidth(BuildContext context){

 if(MediaQuery.of(context).orientation==Orientation.portrait){
    return ScreenSizes(context).screenWidthFraction(percent: 85);
  }else{
    return ScreenSizes(context).screenWidthFraction(percent: 68);
  }
}


orientationManagerHeight(BuildContext context){
  if(MediaQuery.of(context).orientation==Orientation.portrait){
    return ScreenSizes(context).screenHeightFraction(percent: 85);
  }else{
    return ScreenSizes(context).screenHeightFraction(percent: 80);
  }
}


bool isTablet(BuildContext context) {
  return MediaQuery.of(context).size.longestSide >= 900;
}



Widget _patientDetails(BuildContext context) {
  InkWell patient_ID({required BuildContext context,required double parentWidth,required double parentHeight}) {
    return InkWell(
      onTap: () =>
          BlocProvider.of<FormValidatorAndCustomKeyboardNavigationManagerBloc>(
                  context)
              .add(FormValidatorAndCustomKeyboardNavigationManagerEvent
                  .navigateToNumPad(
                      isObsure: false,
                      isFinite: true,
                      limit: 7,
                      label: "Patient ID",
                      valueNotifier: PatientDetailsValueListnerBuilders.P_ID,
                      context: context)),
      child: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 12, right: 7),
        margin: const EdgeInsets.only(left: 10),
        width: ScreenSizes(context).relativeWidth(parentWidth: parentWidth, percent: 82),
        height: ScreenSizes(context).relativeHeight(parentHeight: parentHeight, percent: 8),
        decoration: BoxDecoration(
          border: Border.all(
            width: 0.7,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Text(
              "Patient ID : ",
              style: DS_Style_QuickSand.params(
                  textColor: Colors.black, fontSize: 12),
            ),
            ValueListenableBuilder(
              valueListenable: PatientDetailsValueListnerBuilders.P_ID,
              builder: (context, value, child) {
                return Text(
                  value,
                  style: DS_Style_QuickSand.params(
                      textColor: Colors.black, fontSize: 12),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _submitButton({required BuildContext context,required double parentWidth,required double parentHeight}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppUtil.appColors.button,
            borderRadius: BorderRadius.circular(7),
          ),
         width: ScreenSizes(context).relativeWidth(parentWidth: parentWidth, percent: 45),
        height: ScreenSizes(context).relativeHeight(parentHeight: parentHeight, percent: 8),

          child: Text(
            "Submit",
            style: DS_Style_QuickSand.params(
                fontSize: 14,
                textColor: Colors.black,
                fontWeight: FontWeight.w700),
          ),
        ),
        Expanded(
          // child: Container(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                child: Text("Skip",
                    style: DS_Style_QuickSand.params(
                        fontSize: 14,
                        textColor: const Color.fromARGB(164, 0, 0, 0),
                        fontWeight: FontWeight.w700)),
              )
              , SizedBox(width: ScreenSizes(context).relativeWidth(parentWidth: parentWidth, percent: 6),)
            ],
          ),
        )
      ],
    );
  }

  Row _ageAndGender({required BuildContext context,required double parentWidth,required double parentHeight}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () => BlocProvider.of<
                  FormValidatorAndCustomKeyboardNavigationManagerBloc>(context)
              .add(FormValidatorAndCustomKeyboardNavigationManagerEvent
                  .navigateToNumPad(
                      isObsure: false,
                      limit: 3,
                      label: "age",
                      valueNotifier: PatientDetailsValueListnerBuilders.age,
                      context: context,
                      isFinite: false)),
          child: Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 12, right: 7),
            margin: const EdgeInsets.only(left: 10),
            width: ScreenSizes(context).relativeWidth(parentWidth: parentWidth, percent: 40),
        height: ScreenSizes(context).relativeHeight(parentHeight: parentHeight, percent: 8),

            decoration: BoxDecoration(
                border: Border.all(width: 0.7),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                Text(
                  "age : ",
                  style: DS_Style_QuickSand.params(
                      textColor: Colors.black, fontSize: 12),
                ),
                ValueListenableBuilder(
                  valueListenable: PatientDetailsValueListnerBuilders.age,
                  builder: (context, value, child) {
                    return Text(value.toString(),
                        style: DS_Style_QuickSand.params(
                            textColor: Colors.black, fontSize: 12));
                  },
                )
              ],
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 12, right: 7),
          margin: const EdgeInsets.only(left: 10),
          width: ScreenSizes(context).relativeWidth(parentWidth: parentWidth, percent: 40),
        height: ScreenSizes(context).relativeHeight(parentHeight: parentHeight, percent: 8),

          decoration: BoxDecoration(
              border: Border.all(width: 0.7),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Text(
                "Gender : ",
                style: DS_Style_QuickSand.params(
                    textColor: Colors.black, fontSize: 12),
              ),
              ValueListenableBuilder(
                valueListenable: PatientDetailsValueListnerBuilders.gender,
                builder: (context, value, child) {
                  return Text(
                    value.toString().substring(7),
                    style: DS_Style_QuickSand.params(
                        textColor: Colors.black, fontSize: 12),
                  );
                },
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _phoneAndPlace({required BuildContext context,required double parentWidth,required double parentHeight}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () => BlocProvider.of<
                  FormValidatorAndCustomKeyboardNavigationManagerBloc>(context)
              .add(FormValidatorAndCustomKeyboardNavigationManagerEvent
                  .navigateToNumPad(
                      isObsure: false,
                      limit: 10,
                      label: "Phone Number",
                      valueNotifier: PatientDetailsValueListnerBuilders.phone,
                      isPhone: true,
                      isFinite: true,
                      context: context)),
          child: Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 12, right: 7),
            margin: const EdgeInsets.only(left: 10),
             width: ScreenSizes(context).relativeWidth(parentWidth: parentWidth, percent: 82),
        height: ScreenSizes(context).relativeHeight(parentHeight: parentHeight, percent: 8),

            decoration: BoxDecoration(
                border: Border.all(width: 0.7),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                Text(
                  "Phone : ",
                  style: DS_Style_QuickSand.params(
                      textColor: Colors.black, fontSize: 12),
                ),
                ValueListenableBuilder(
                  valueListenable: PatientDetailsValueListnerBuilders.phone,
                  builder: (context, value, child) {
                     return Expanded(
                      child: Text(
                        value,overflow: TextOverflow.ellipsis,
                        style: DS_Style_QuickSand.params(
                            textColor: Colors.black, fontSize: 12),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        InkWell(
          onTap: () => BlocProvider.of<
                  FormValidatorAndCustomKeyboardNavigationManagerBloc>(context)
              .add(FormValidatorAndCustomKeyboardNavigationManagerEvent
                  .navigateToKeyBoard(
                      label: "Place",
                      valueNotifier: PatientDetailsValueListnerBuilders.place,
                      context: context,isObscure: false)),
          child: Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 12, right: 7),
            margin: const EdgeInsets.only(left: 10),
              width: ScreenSizes(context).relativeWidth(parentWidth: parentWidth, percent: 82),
        height: ScreenSizes(context).relativeHeight(parentHeight: parentHeight, percent: 8),

            decoration: BoxDecoration(
                border: Border.all(width: 0.7),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                Text(
                  "Place : ",
                  style: DS_Style_QuickSand.params(
                      textColor: Colors.black, fontSize: 12),
                ),
                ValueListenableBuilder(
                  valueListenable: PatientDetailsValueListnerBuilders.place,
                  builder: (context, value, child) {
                    return Expanded(
                      child: Text(
                        value,overflow: TextOverflow.ellipsis,
                        style: DS_Style_QuickSand.params(
                            textColor: Colors.black, fontSize: 12),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  InkWell _address({required BuildContext context,required double parentWidth,required double parentHeight}) {
    return InkWell(
      onTap: () =>
          BlocProvider.of<FormValidatorAndCustomKeyboardNavigationManagerBloc>(
                  context)
              .add(FormValidatorAndCustomKeyboardNavigationManagerEvent
                  .navigateToKeyBoard(
                      label: "Address",
                      valueNotifier: PatientDetailsValueListnerBuilders.address,
                      context: context,isObscure: false)),
      child: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 12, right: 7,top: 5),
        margin: const EdgeInsets.only(left: 10),
        width: ScreenSizes(context).relativeWidth(parentWidth: parentWidth, percent: 82),
        height: ScreenSizes(context).screenHeightFraction(percent: 10),
        decoration: BoxDecoration(
            border: Border.all(width: 0.7),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            const SizedBox(
              height: 3,
            ),
            Row(
              children: [
                Text(
                  "Address : ",
                  style: DS_Style_QuickSand.params(
                      textColor: Colors.black, fontSize: 12),
                ),
                ValueListenableBuilder(
                  valueListenable: PatientDetailsValueListnerBuilders.address,
                  builder: (context, value, child) {
                    return Expanded(
                      child: Text(
                        value,overflow: TextOverflow.ellipsis,
                        style: DS_Style_QuickSand.params(
                            textColor: Colors.black, fontSize: 12),
                      ),
                    );
                  },
                )
              ],
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }

  Column _patientName({required BuildContext context,required double parentWidth,required double parentHeight}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () => BlocProvider.of<
                  FormValidatorAndCustomKeyboardNavigationManagerBloc>(context)
              .add(FormValidatorAndCustomKeyboardNavigationManagerEvent
                  .navigateToKeyBoard(
                      label: "First Name",
                      valueNotifier:
                          PatientDetailsValueListnerBuilders.firstName,
                      context: context,isObscure: false)),
          child: Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 12, right: 7),
            margin: const EdgeInsets.only(left: 10),
             width: ScreenSizes(context).relativeWidth(parentWidth: parentWidth, percent: 82),
        height: ScreenSizes(context).relativeHeight(parentHeight: parentHeight, percent: 8),

            decoration: BoxDecoration(
                border: Border.all(width: 0.7),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                Text(
                  "First Name : ",
                  style: DS_Style_QuickSand.params(
                      textColor: Colors.black, fontSize: 12),
                ),
                ValueListenableBuilder(
                  valueListenable: PatientDetailsValueListnerBuilders.firstName,
                  builder: (context, value, child) {
                    return Expanded(
                      child: Text(
                        value,overflow: TextOverflow.ellipsis,
                        style: DS_Style_QuickSand.params(
                            textColor: Colors.black, fontSize: 12),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
                       SizedBox(height: 10),

        InkWell(
          onTap: () => BlocProvider.of<
                  FormValidatorAndCustomKeyboardNavigationManagerBloc>(context)
              .add(FormValidatorAndCustomKeyboardNavigationManagerEvent
                  .navigateToKeyBoard(
                      label: "Last Name",
                      valueNotifier:
                          PatientDetailsValueListnerBuilders.lastName,
                      context: context,isObscure: false)),
          child: Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 12, right: 7),
            margin: const EdgeInsets.only(left: 10),
             width: ScreenSizes(context).relativeWidth(parentWidth: parentWidth, percent: 82),
        height: ScreenSizes(context).relativeHeight(parentHeight: parentHeight, percent: 8),

            decoration: BoxDecoration(
                border: Border.all(width: 0.7),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                Text(
                  "Last Name : ",
                  style: DS_Style_QuickSand.params(
                      textColor: Colors.black, fontSize: 12),
                ),
                ValueListenableBuilder(
                  valueListenable: PatientDetailsValueListnerBuilders.lastName,
                  builder: (context, value, child) {
                    return Expanded(
                      child: Text(
                        value,overflow: TextOverflow.ellipsis,
                        style: DS_Style_QuickSand.params(
                            textColor: Colors.black, fontSize: 12),
                      ),
                    );
                    
                  },
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  return isTablet(context)? Dialog(
    child: Container(
      margin: const EdgeInsets.only(top: 20),
      height: orientationManagerHeight(context),
      width: orientationManagerWidth(context),
      // height: ScreenSizes(context).screenHeightFraction(percent: 68),
      // width: ScreenSizes(context).screenWidthFraction(percent: 44),
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                "Patient Details",
                style: DS_Style_QuickSand.params(
                    fontSize: 24, fontWeight: FontWeight.w600, letterSpacing: 2.7),
              ),
              const SizedBox(height: 30),
              patient_ID(context:context,parentWidth: orientationManagerWidth(context),parentHeight: orientationManagerHeight(context)),
              const SizedBox(height: 9),
              Row(
                children: [
                  const Spacer(),
                  Text(
                    "or",
                    style: DS_Style_QuickSand.params(),
                  ),
                  const Spacer()
                ],
              ),
              const SizedBox(height: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _patientName(context:context,parentWidth: orientationManagerWidth(context),parentHeight: orientationManagerHeight(context)),
                  const SizedBox(
                    height: 8,
                  ),
                  _address(context:context,parentWidth: orientationManagerWidth(context),parentHeight: orientationManagerHeight(context)),
                ],
              ),
              // _gender_radio()
              const SizedBox(height: 12),
              _phoneAndPlace(context:context,parentWidth: orientationManagerWidth(context),parentHeight: orientationManagerHeight(context)),
              const SizedBox(height: 10),
              _ageAndGender(context:context,parentWidth: orientationManagerWidth(context),parentHeight: orientationManagerHeight(context)),
              const SizedBox(height: 25),
              _submitButton(context:context,parentWidth: orientationManagerWidth(context),parentHeight: orientationManagerHeight(context)),
            ],
          ), const SizedBox(height: 25),

        ],
      ),
    ),
  
  
  
  ):PatientDetailsScreenForMobile(ctx: context,);

}

class PatientDetailsScreenForMobile extends StatelessWidget {
  BuildContext ctx;
   PatientDetailsScreenForMobile({
    super.key,required this.ctx
  });

  @override
  Widget build(ctx) {
    return Scaffold(body: Container(
        margin: const EdgeInsets.only(top: 20),
        height: orientationManagerHeight(ctx),
        width: orientationManagerWidth(ctx),
        // height: ScreenSizes(context).screenHeightFraction(percent: 68),
        // width: ScreenSizes(context).screenWidthFraction(percent: 44),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  "Patient Details",
                  style: DS_Style_QuickSand.params(
                      fontSize: 24, fontWeight: FontWeight.w600, letterSpacing: 2.7),
                ),
                const SizedBox(height: 30),
                patient_ID(context:ctx,parentWidth: orientationManagerWidth(ctx),parentHeight: orientationManagerHeight(ctx)),
                const SizedBox(height: 9),
                Row(
                  children: [
                    const Spacer(),
                    Text(
                      "or",
                      style: DS_Style_QuickSand.params(),
                    ),
                    const Spacer()
                  ],
                ),
                const SizedBox(height: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // _patientName(context:context,parentWidth: orientationManagerWidth(context),parentHeight: orientationManagerHeight(context)),
                    const SizedBox(
                      height: 8,
                    ),
                    // _address(context:context,parentWidth: orientationManagerWidth(context),parentHeight: orientationManagerHeight(context)),
                  ],
                ),
                // _gender_radio()
                const SizedBox(height: 12),
                // _phoneAndPlace(context:context,parentWidth: orientationManagerWidth(context),parentHeight: orientationManagerHeight(context)),
                const SizedBox(height: 10),
                // _ageAndGender(context:context,parentWidth: orientationManagerWidth(context),parentHeight: orientationManagerHeight(context)),
                const SizedBox(height: 25),
                // _submitButton(context:context,parentWidth: orientationManagerWidth(context),parentHeight: orientationManagerHeight(context)),
              ],
            ), const SizedBox(height: 25),

          ],
        ),
      ),
    );
  }
}
