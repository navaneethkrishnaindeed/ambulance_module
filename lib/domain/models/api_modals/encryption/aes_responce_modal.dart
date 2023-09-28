import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'aes.dart';

class AesResponceModal extends Equatable {
	final Aes? aes;

	const AesResponceModal({this.aes});

	factory AesResponceModal.fromMap(Map<String, dynamic> data) {
		return AesResponceModal(
			aes: data['AES'] == null
						? null
						: Aes.fromMap(data['AES'] as Map<String, dynamic>),
		);
	}


  
	Map<String, dynamic> toMap() => {
				'AES': aes?.toMap(),
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AesResponceModal].
	factory AesResponceModal.fromJson(String data) {
		return AesResponceModal.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [AesResponceModal] to a JSON string.
	String toJson() => json.encode(toMap());

	AesResponceModal copyWith({
		Aes? aes,
	}) {
		return AesResponceModal(
			aes: aes ?? this.aes,
		);
	}

	@override
	bool get stringify => true;

	@override
	List<Object?> get props => [aes];
}
