import 'dart:convert';

import 'package:collection/collection.dart';

class HospitalListOfDriver {
	int? hospitalId;
	String? hospitalName;

	HospitalListOfDriver({this.hospitalId, this.hospitalName});

	@override
	String toString() {
		return 'HospitalListOfDriver(hospitalId: $hospitalId, hospitalName: $hospitalName)';
	}

	factory HospitalListOfDriver.fromMap(Map<String, dynamic> data) {
		return HospitalListOfDriver(
			hospitalId: data['Hospital_Id'] as int?,
			hospitalName: data['Hospital_Name'] as String?,
		);
	}



	Map<String, dynamic> toMap() => {
				'Hospital_Id': hospitalId,
				'Hospital_Name': hospitalName,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [HospitalListOfDriver].
	factory HospitalListOfDriver.fromJson(String data) {
		return HospitalListOfDriver.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [HospitalListOfDriver] to a JSON string.
	String toJson() => json.encode(toMap());

	HospitalListOfDriver copyWith({
		int? hospitalId,
		String? hospitalName,
	}) {
		return HospitalListOfDriver(
			hospitalId: hospitalId ?? this.hospitalId,
			hospitalName: hospitalName ?? this.hospitalName,
		);
	}

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! HospitalListOfDriver) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toMap(), toMap());
	}

	@override
	int get hashCode => hospitalId.hashCode ^ hospitalName.hashCode;
}
