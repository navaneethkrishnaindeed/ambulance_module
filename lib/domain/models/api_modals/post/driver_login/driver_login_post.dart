import 'dart:convert';

import 'package:collection/collection.dart';


class DriverLoginPost {
	final String? phoneNumber;
	final String? password;
	final String? hospitals;

	const DriverLoginPost({this.phoneNumber, this.password, this.hospitals});

	@override
	String toString() {
		return 'DriverLoginPost(phoneNumber: $phoneNumber, password: $password, hospitals: $hospitals)';
	}

  

	factory DriverLoginPost.fromMap(Map<String, dynamic> data) {
		return DriverLoginPost(
			phoneNumber: data['phoneNumber'] as String?,
			password: data['password'] as String?,
			hospitals: data['hospitals'] as String?,
		);
	}



	Map<String, dynamic> toMap() => {
				'phoneNumber': phoneNumber,
				'password': password,
				'hospitals': hospitals,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [DriverLoginPost].
	factory DriverLoginPost.fromJson(String data) {
		return DriverLoginPost.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [DriverLoginPost] to a JSON string.
	String toJson() => json.encode(toMap());

	DriverLoginPost copyWith({
		String? phoneNumber,
		String? password,
		String? hospitals,
	}) {
		return DriverLoginPost(
			phoneNumber: phoneNumber ?? this.phoneNumber,
			password: password ?? this.password,
			hospitals: hospitals ?? this.hospitals,
		);
	}

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! DriverLoginPost) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toMap(), toMap());
	}

	@override
	int get hashCode =>
			phoneNumber.hashCode ^
			password.hashCode ^
			hospitals.hashCode;
}
