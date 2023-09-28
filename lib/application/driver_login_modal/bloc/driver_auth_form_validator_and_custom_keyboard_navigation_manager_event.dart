part of 'driver_auth_form_validator_and_custom_keyboard_navigation_manager_bloc.dart';

@freezed
class DriverAuthFormValidatorAndCustomKeyboardNavigationManagerEvent
    with _$DriverAuthFormValidatorAndCustomKeyboardNavigationManagerEvent {
  const factory DriverAuthFormValidatorAndCustomKeyboardNavigationManagerEvent.started() =
      Started;


  const factory DriverAuthFormValidatorAndCustomKeyboardNavigationManagerEvent.keyboardNavigator({
    required String label,
    required ValueNotifier valueNotifier,
    required BuildContext context,
        required bool isObscure,
  }) = KeyboardNavigationHandler;

 
   const factory DriverAuthFormValidatorAndCustomKeyboardNavigationManagerEvent.numPadNavigator(
    {required bool isObsure,
      required int limit,
      required String label,
      required ValueNotifier valueNotifier,
      required BuildContext context,
      required bool isFinite,
    bool? isPhone})=NumpadNavigator;


    const factory DriverAuthFormValidatorAndCustomKeyboardNavigationManagerEvent.login({required BuildContext context }) = Login;


    
}
