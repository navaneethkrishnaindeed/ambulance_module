part of 'assign_ambulance_with_driver_bloc.dart';

@freezed
class AmbulanceSearchModalEvent with _$AmbulanceSearchModalEvent {
  const factory AmbulanceSearchModalEvent.started() = Started;
  const factory AmbulanceSearchModalEvent.keyboardNavigator({
    required String label,
    required ValueNotifier valueNotifier,
    required BuildContext context,
    required bool isObscure,
  }) = KeyboardNavigationHandler;

  const factory AmbulanceSearchModalEvent.numPadNavigator(
        {required bool isObsure,
      required int limit,
      required String label,
      required ValueNotifier valueNotifier,
      required BuildContext context,
      required bool isFinite,
      bool? isPhone})=NumpadNavigator;
}