// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'dart:ffi';

import 'package:ambulance_module/presentation/components/custom_numpad/custom_numpad.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/routes/routes.dart';
import '../../../infrastructure/global_database/apis/auth/driver_login_repo/i_repo.dart';
import '../../../infrastructure/global_database/apis/auth/pre_login_auth_repo/i_repo.dart';
import '../../../infrastructure/local_database/secured_shared_preference/secured_shared_preference.dart';
import '../../../presentation/components/custom_keyboard/custom_keyboard.dart';

part 'driver_auth_form_validator_and_custom_keyboard_navigation_manager_event.dart';
part 'driver_auth_form_validator_and_custom_keyboard_navigation_manager_state.dart';
part 'driver_auth_form_validator_and_custom_keyboard_navigation_manager_bloc.freezed.dart';

@injectable
class DriverAuthFormValidatorAndCustomKeyboardNavigationManagerBloc extends Bloc<
      DriverAuthFormValidatorAndCustomKeyboardNavigationManagerEvent,
       DriverAuthFormValidatorAndCustomKeyboardNavigationManagerState> {
     DriverAuthFormValidatorAndCustomKeyboardNavigationManagerBloc()
      : super(_Initial()) {


  FlutterLocalSecuredStorage _securedStorageinstance = FlutterLocalSecuredStorage();

    on<Started>((event, emit) => null);

    on<KeyboardNavigationHandler>((event, emit) async {
      Navigator.of(event.context).push(MaterialPageRoute(
        builder: (context) => CustomKeyboard(
          label: event.label,
          valueNotfier: event.valueNotifier,
          isObscure: event.isObscure,
        ),
      ));
    });
      
    IPreLoginRepo preLoginRepo = IPreLoginRepo();

    on<NumpadNavigator>((event, emit) async {

      Navigator.of(event.context).push(MaterialPageRoute(
          builder: (context) => CustomNumPad(
                isObscure: event.isObsure,
                limit: event.limit,
                label: event.label,
                valueNotfier: event.valueNotifier,
                isFinite: event.isFinite,
                isPhone: event.isPhone,
                // funct: ,
                funct: () async {
                  await preLoginRepo.postPreLoginAuth(
                      phoneNumber: event.valueNotifier.value);
                  log("message");
                },
              )));
              
    });

     
     on<Login>((event, emit)async {
         
       var responce= await IDriverLoginRepo().postDriverLoginService();
       if(responce=="200"){
        Navigator.of(event.context).pushNamedAndRemoveUntil(RoutPaths.driverLoginScreen, (route) => false);
       }else{
         showDialog(
          context: event.context,
          builder: (context) =>  Dialog(child: Container(alignment: Alignment.center, width: 100,height: 400,child:const Text("Invalid Credentials "),),),
        );
       }
     });

  }
}
