import 'dart:convert';

import 'package:bi_tracer/models/mother_model.dart';

class Doctor {
  String? doctorName;
  String? phoneNumber;
  String? adress;
  String? uid;
  String? emailAdress;
  String? specialization;
  String? password;
  String? confirmPassword;
  List<Mother> mothers;
  Doctor({
    this.doctorName,
    this.phoneNumber,
    this.adress,
    this.uid,
    this.emailAdress,
    this.specialization,
    this.password,
    this.confirmPassword,
    this.mothers = const [],
  });

  Map<String, dynamic> toMap() {
    return {
      'doctorName': doctorName,
      'phoneNumber': phoneNumber,
      'adress': adress,
      'uid': uid,
      'emailAdress': emailAdress,
      'specialization': specialization,
      'password': password,
      'confirmPassword': confirmPassword,
      'mothers': mothers.map((x) => x.toMap()).toList(),
    };
  }

  factory Doctor.fromMap(Map<String, dynamic> map) {
    return Doctor(
      doctorName: map['doctorName'] != null ? map['doctorName'] : null,
      phoneNumber: map['phoneNumber'] != null ? map['phoneNumber'] : null,
      adress: map['adress'] != null ? map['adress'] : null,
      uid: map['uid'] != null ? map['uid'] : null,
      emailAdress: map['emailAdress'] != null ? map['emailAdress'] : null,
      specialization:
          map['specialization'] != null ? map['specialization'] : null,
      password: map['password'] != null ? map['password'] : null,
      confirmPassword:
          map['confirmPassword'] != null ? map['confirmPassword'] : null,
      mothers: List<Mother>.from(map['mothers']?.map((x) => Mother.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Doctor.fromJson(String source) => Doctor.fromMap(json.decode(source));

  Doctor copyWith({
    String? doctorName,
    String? phoneNumber,
    String? adress,
    String? uid,
    String? emailAdress,
    String? specialization,
    String? password,
    String? confirmPassword,
    List<Mother>? mothers,
  }) {
    return Doctor(
      doctorName: doctorName ?? this.doctorName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      adress: adress ?? this.adress,
      uid: uid ?? this.uid,
      emailAdress: emailAdress ?? this.emailAdress,
      specialization: specialization ?? this.specialization,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      mothers: mothers ?? this.mothers,
    );
  }
}
