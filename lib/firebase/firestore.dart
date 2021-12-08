import 'package:bi_tracer/models/baby_model.dart';
import 'package:bi_tracer/models/doctor_model.dart';
import 'package:bi_tracer/models/mother_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FireStoreHelper {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static createMothers(Mother mother) {
    firestore.collection("mothers").doc(mother.uid).set(mother.toMap());
  }

  static createDoctor(Doctor doctor) {
    firestore.collection("doctors").doc(doctor.uid).set(doctor.toMap());
  }

  static createBaby(Baby baby, String uid) {
    firestore.collection("babys").doc(uid).set(baby.toMap());
  }

  static linkMotherToDoctor(Doctor doctor, Mother mother) {
    firestore.collection("mothers").doc(mother.uid).update({"doctor": doctor});
  }

  Stream<QuerySnapshot> getBabysforMother(Mother mother) {
    return firestore
        .collection('babys')
        .where("mother", isEqualTo: mother)
        .snapshots();
  }

  Stream<QuerySnapshot> getMothersbyDoctor(Doctor doctor) {
    return firestore
        .collection('mothers')
        .where("doctor", isEqualTo: doctor)
        .snapshots();
  }

  Stream<QuerySnapshot> getCollection(String collectionName) {
    return firestore.collection('collectionName').snapshots();
  }
}
