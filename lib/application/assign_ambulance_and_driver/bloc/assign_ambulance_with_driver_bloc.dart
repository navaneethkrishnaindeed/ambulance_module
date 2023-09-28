import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../presentation/components/custom_keyboard/custom_keyboard.dart';
import '../../../presentation/components/custom_numpad/custom_numpad.dart';

part 'assign_ambulance_with_driver_event.dart';
part 'assign_ambulance_with_driver_state.dart';
part 'assign_ambulance_with_driver_bloc.freezed.dart';

@injectable
class AmbulanceSearchModalBloc extends Bloc<AmbulanceSearchModalEvent,
    AmbulanceSearchModalState> {
  AmbulanceSearchModalBloc() : super(_Initial()) {
    on<Started>((event, emit) => null);

    on<KeyboardNavigationHandler>((event, emit) => Navigator.of(event.context).push(MaterialPageRoute(
              builder: (context) => CustomKeyboard(
                  label: event.label, valueNotfier: event.valueNotifier,isObscure: event.isObscure,),
            )));

    on<NumpadNavigator>((event, emit) =>Navigator.of(event.context).push(MaterialPageRoute(
            builder: (context) => CustomNumPad(
                  isObscure: event.isObsure,
                  limit: event.limit,
                  label: event.label,
                  valueNotfier: event.valueNotifier,
                  isFinite: event.isFinite,
                  isPhone: event.isPhone,
                ))));
  }
}
