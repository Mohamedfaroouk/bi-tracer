import 'dart:math';

import 'package:bi_tracer/firebase/firestore.dart';
import 'package:bi_tracer/models/mother_model.dart';
import 'package:bi_tracer/screens/register_mother.dart';
import 'package:bi_tracer/shared/navigator.dart';
import 'package:bi_tracer/shared/stream_design.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Mothers extends StatefulWidget {
  const Mothers({Key? key}) : super(key: key);

  @override
  _MothersState createState() => _MothersState();
}

class _MothersState extends State<Mothers> {
  Mother _mother =Mother();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mothers'),
        centerTitle: true,
      ),
body:streamDesign( FireStoreHelper.getCollection('mothers'), _mother, 'mother') ,
      floatingActionButton: FloatingActionButton.extended(onPressed: (){
        navigate(context: context, route:RegisterMother() );
      }, label: Text('Add Mother')),

    );
  }
}
