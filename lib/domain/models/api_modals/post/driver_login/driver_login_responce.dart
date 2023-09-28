import 'dart:convert';

import 'package:collection/collection.dart';

class DriverLoginResponce {
	int? status;
	String? message;
	String? token;
	String? hospitalId;
	String? hospitalName;
	String? image;

	DriverLoginResponce({
		this.status, 
		this.message, 
		this.token, 
		this.hospitalId, 
		this.hospitalName, 
		this.image, 
	});

	@override
	String toString() {
		return 'DriverLoginResponce(status: $status, message: $message, token: $token, hospitalId: $hospitalId, hospitalName: $hospitalName, image: $image)';
	}

	factory DriverLoginResponce.fromMap(Map<String, dynamic> data) {
		return DriverLoginResponce(
			status: data['status'] as int?,
			message: data['message'] as String?,
			token: data['Token'] as String?,
			hospitalId: data['Hospital_ID'] as String?,
			hospitalName: data['HospitalName'] as String?,
			image: data['Image'] as String?,
		);
	}



	Map<String, dynamic> toMap() => {
				'status': status,
				'message': message,
				'Token': token,
				'Hospital_ID': hospitalId,
				'HospitalName': hospitalName,
				'Image': image,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [DriverLoginResponce].
	factory DriverLoginResponce.fromJson(String data) {
		return DriverLoginResponce.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [DriverLoginResponce] to a JSON string.
	String toJson() => json.encode(toMap());

	DriverLoginResponce copyWith({
		int? status,
		String? message,
		String? token,
		String? hospitalId,
		String? hospitalName,
		String? image,
	}) {
		return DriverLoginResponce(
			status: status ?? this.status,
			message: message ?? this.message,
			token: token ?? this.token,
			hospitalId: hospitalId ?? this.hospitalId,
			hospitalName: hospitalName ?? this.hospitalName,
			image: image ?? this.image,
		);
	}

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! DriverLoginResponce) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toMap(), toMap());
	}

	@override
	int get hashCode =>
			status.hashCode ^
			message.hashCode ^
			token.hashCode ^
			hospitalId.hashCode ^
			hospitalName.hashCode ^
			image.hashCode;
}
