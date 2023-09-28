import 'dart:convert';

import 'package:collection/collection.dart';

class DriverDetailsModel {
	String? userIdPk;
	String? name;
	String? userId;
	int? hospitalId;
	dynamic profileImage;

	DriverDetailsModel({
		this.userIdPk, 
		this.name, 
		this.userId, 
		this.hospitalId, 
		this.profileImage, 
	});

	@override
	String toString() {
		return 'DriverDetailsModel(userIdPk: $userIdPk, name: $name, userId: $userId, hospitalId: $hospitalId, profileImage: $profileImage)';
	}

	factory DriverDetailsModel.fromMap(Map<String, dynamic> data) {
		return DriverDetailsModel(
			userIdPk: data['UserID_PK'] as String?,
			name: data['Name'] as String?,
			userId: data['UserId'] as String?,
			hospitalId: data['Hospital_ID'] as int?,
			profileImage: data['ProfileImage'] as dynamic,
		);
	}



	Map<String, dynamic> toMap() => {
				'UserID_PK': userIdPk,
				'Name': name,
				'UserId': userId,
				'Hospital_ID': hospitalId,
				'ProfileImage': profileImage,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [DriverDetailsModel].
	factory DriverDetailsModel.fromJson(String data) {
		return DriverDetailsModel.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [DriverDetailsModel] to a JSON string.
	String toJson() => json.encode(toMap());

	DriverDetailsModel copyWith({
		String? userIdPk,
		String? name,
		String? userId,
		int? hospitalId,
		dynamic profileImage,
	}) {
		return DriverDetailsModel(
			userIdPk: userIdPk ?? this.userIdPk,
			name: name ?? this.name,
			userId: userId ?? this.userId,
			hospitalId: hospitalId ?? this.hospitalId,
			profileImage: profileImage ?? this.profileImage,
		);
	}

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! DriverDetailsModel) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toMap(), toMap());
	}

	@override
	int get hashCode =>
			userIdPk.hashCode ^
			name.hashCode ^
			userId.hashCode ^
			hospitalId.hashCode ^
			profileImage.hashCode;
}
