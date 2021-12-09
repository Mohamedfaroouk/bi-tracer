import 'dart:math';

import 'package:bi_tracer/models/baby_model.dart';
import 'package:bi_tracer/models/doctor_model.dart';
import 'package:bi_tracer/models/mother_model.dart';
import 'package:bi_tracer/screens/mother_details.dart';
import 'package:bi_tracer/shared/navigator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget streamDesign (Stream<QuerySnapshot> stream,model, String type ){

  return StreamBuilder<QuerySnapshot>(
    stream:stream,
    builder: (context , snapshot ){
      if (snapshot.hasError) {
        return Center(child: Text('Something went wrong'));
      }
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator());
      }
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal:10 , vertical: 15 ),
        child: ListView.builder(itemBuilder: (context , index){
final list = snapshot.data!.docs.map((e)  {return sss(type, e);

Doctor.fromMap(e.data() as Map<String, dynamic>);
        }).toList();
          return Column(
            children: [
              ListTile(
                onTap: (){
              if(type=="mother"){
              //  navigate(context: context, route: MotherDetails(m: model));
              }
              if(type=="doctor"){
             //   navigate(context: context, route: );
              }if(type=="child"){
             //   navigate(context: context, route: );
              }
                },
                leading: CircleAvatar(
                  backgroundColor:
                  Colors.primaries[min(list[index].name!.length, 17)],
                  child:  Text(list[index].name![0].toUpperCase()),
                ),
                title: Text("Dr. "+list[index].name!),
              ),
              SizedBox(width: MediaQuery.of(context).size.width*.75,
                child: Divider(thickness: 1.5,color: Colors.black,),)
            ],
          );
        },
          itemCount: snapshot.data!.docs.length,
        ),
      );
    },
  );
}


sss(type , e){
  if(type=="mother"){
    return Mother.fromMap(e.data() as Map<String, dynamic>);
  }
  if(type=="doctor"){
    return Doctor.fromMap(e.data() as Map<String, dynamic>);
  }else{
    return Baby.fromMap(e.data() as Map<String, dynamic>);
  }
}