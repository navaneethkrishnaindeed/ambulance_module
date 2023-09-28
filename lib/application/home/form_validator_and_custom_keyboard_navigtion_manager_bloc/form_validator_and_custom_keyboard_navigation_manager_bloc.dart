import 'dart:async';

import 'package:ambulance_module/presentation/components/custom_keyboard/custom_keyboard.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/routes/routes.dart';
import '../../../infrastructure/global_database/apis/auth/pre_login_auth_repo/i_repo.dart';
import '../../../presentation/components/custom_numpad/custom_numpad.dart';
import '../../../presentation/components/modals/assign_ambulance_and_driver.dart';

part 'form_validator_and_custom_keyboard_navigation_manager_event.dart';
part 'form_validator_and_custom_keyboard_navigation_manager_state.dart';
part 'form_validator_and_custom_keyboard_navigation_manager_bloc.freezed.dart';

@injectable
class FormValidatorAndCustomKeyboardNavigationManagerBloc extends Bloc<
    FormValidatorAndCustomKeyboardNavigationManagerEvent,
    FormValidatorAndCustomKeyboardNavigationManagerState> {
  FormValidatorAndCustomKeyboardNavigationManagerBloc()
      : super(const _Initial()) {
    on<Started>((event, emit) => 
    //  Timer(
    //      const Duration(seconds: 1),
    //       () =>showDialog(context: event.context, builder:(context) =>const AmbulanceSearchModal(),)
    //   )
    null
        );


        
    on<NumPadNavigationHandler>((event, emit) {
      Navigator.of(event.context).push(MaterialPageRoute(
        builder: (context) {
          return CustomNumPad(
            isObscure: event.isObsure,
            isFinite: event.isFinite,
            limit: event.limit,
            label: event.label,
            valueNotfier: event.valueNotifier,
            isPhone: event.isPhone,
            
          );
        },
      ));

    

    });

    on<KeyboardNavigationHandler>(
        (event, emit) => Navigator.of(event.context).push(MaterialPageRoute(
              builder: (context) => CustomKeyboard(
                  label: event.label, valueNotfier: event.valueNotifier,isObscure: event.isObscure,),
            )));
  }
}
