// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter/foundation.dart';

enum Gender { Male, Female, Others }

abstract class PatientDetailsValueListnerBuilders {
  static ValueNotifier<String> P_ID = ValueNotifier("XXDSF");
  static ValueNotifier<String> firstName = ValueNotifier("");
  static ValueNotifier<String> lastName = ValueNotifier("");

  static ValueNotifier<String> address = ValueNotifier("");
  static ValueNotifier<String> phone = ValueNotifier("");
  static ValueNotifier<String> place = ValueNotifier("");
  static ValueNotifier<String?> age = ValueNotifier(null);
  static ValueNotifier<Gender> gender = ValueNotifier(Gender.Male);

}


abstract class MapsFromTo{
    static ValueNotifier<String> from = ValueNotifier("");
      static ValueNotifier<String> to = ValueNotifier("");


}