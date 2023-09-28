import 'dart:convert';

import 'package:equatable/equatable.dart';

class Aes extends Equatable {
	final String? value;

	const Aes({this.value});

	factory Aes.fromMap(Map<String, dynamic> data) => Aes(
				value: data['value'] as String?,
			);

	Map<String, dynamic> toMap() => {
				'value': value,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Aes].
	factory Aes.fromJson(String data) {
		return Aes.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Aes] to a JSON string.
	String toJson() => json.encode(toMap());

	Aes copyWith({
		String? value,
	}) {
		return Aes(
			value: value ?? this.value,
		);
	}

	@override
	bool get stringify => true;

	@override
	List<Object?> get props => [value];
}
