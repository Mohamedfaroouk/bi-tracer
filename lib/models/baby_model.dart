import 'dart:convert';

import 'package:bi_tracer/models/mother_model.dart';

class Baby {
  String? name;
  String? dateOfBirth;
  String? gender;
  String? temp;
  String? lattude;
  String? longtude;
  String? heartPulse;
  String? yellowColor;
  String? camera;

  Mother? mother;
  Baby({
    this.name,
    this.mother,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'mother': mother?.toMap(),
    };
  }

  factory Baby.fromMap(Map<String, dynamic> map) {
    return Baby(
      name: map['name'] != null ? map['name'] : null,
      mother: map['mother'] != null ? Mother.fromMap(map['mother']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Baby.fromJson(String source) => Baby.fromMap(json.decode(source));

  Baby copyWith({
    String? name,
    Mother? mother,
  }) {
    return Baby(
      name: name ?? this.name,
      mother: mother ?? this.mother,
    );
  }
}
