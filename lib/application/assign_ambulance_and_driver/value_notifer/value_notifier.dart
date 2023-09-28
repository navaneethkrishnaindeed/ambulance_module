import 'package:flutter/material.dart';

abstract class AmbulanceConfigurationValueNotifierListners {
  static ValueNotifier<String> ambulanceID = ValueNotifier("");
  static ValueNotifier<String> searchKey = ValueNotifier("");
  static ValueNotifier<int> Ambulancelimit = ValueNotifier(15);
  static ValueNotifier<List<bool>> selected = ValueNotifier(List.generate(Ambulancelimit.value, (index) => false));
}
