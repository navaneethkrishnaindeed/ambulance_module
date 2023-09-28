part of 'form_validator_and_custom_keyboard_navigation_manager_bloc.dart';

@freezed
class FormValidatorAndCustomKeyboardNavigationManagerEvent
    with _$FormValidatorAndCustomKeyboardNavigationManagerEvent {
  const factory FormValidatorAndCustomKeyboardNavigationManagerEvent.init({
    required BuildContext context,
  }) = Started;
  const factory FormValidatorAndCustomKeyboardNavigationManagerEvent.navigateToNumPad(
      {required bool isObsure,
      required int limit,
      required String label,
      required ValueNotifier valueNotifier,
      required BuildContext context,
      required bool isFinite,
      bool? isPhone}) = NumPadNavigationHandler;

  const factory FormValidatorAndCustomKeyboardNavigationManagerEvent.navigateToKeyBoard({
    required String label,
    required ValueNotifier valueNotifier,
    required BuildContext context,
        required bool isObscure,

  }) = KeyboardNavigationHandler;
}
