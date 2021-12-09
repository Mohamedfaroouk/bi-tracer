import 'package:bi_tracer/firebase/firestore.dart';
import 'package:bi_tracer/models/baby_model.dart';
import 'package:bi_tracer/models/mother_model.dart';
import 'package:bi_tracer/shared/auth_button.dart';
import 'package:bi_tracer/shared/constants.dart';
import 'package:bi_tracer/shared/text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BabyDetails extends StatelessWidget {
  BabyDetails({Key? key, required this.baby}) : super(key: key);
  Baby baby;
  @override
  Widget build(BuildContext context) {
    /* baby = Baby(
        gender: "female",
        name: "sara ahmed ",
        temp: "12",
        heartPulse: "1231",
        mother: Mother(
          email: "sdsd@gmail.com",
          name: "sara ahmed ",
          fatherName: "ahmed",
          fatherPhone: "010123123",
          motherPhone: "0123124124",
        ),
        yellowColor: "20"); */

    return StreamBuilder<DocumentSnapshot>(
        stream: FireStoreHelper.getBabyDataById(baby.babyId!),
        builder: (context, snapshot) {
          final baby =
              Baby.fromMap(snapshot.data!.data() as Map<String, dynamic>);
          return Scaffold(
            appBar: AppBar(
              title: Text("Baby Profile"),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                width: double.infinity,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: Card(
                              color: mainColor,
                              child: Align(
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.baby,
                                      color: Colors.white,
                                      size: 40,
                                    ),
                                    myText(baby.name!.toUpperCase(),
                                        size: 30, color: Colors.white),
                                  ],
                                ),
                              ))),
                      ListTile(
                        title: Text("Baby Temp"),
                        trailing: FaIcon(FontAwesomeIcons.temperatureLow),
                        subtitle: Text(baby.temp!),
                      ),
                      Divider(),
                      ListTile(
                        trailing: FaIcon(FontAwesomeIcons.babyCarriage),
                        title: Text("Baby Yellow Percent"),
                        subtitle: Text(baby.yellowColor! + "%"),
                      ),
                      Divider(),
                      ListTile(
                        title: Text("Baby Heart Pulse"),
                        trailing: FaIcon(FontAwesomeIcons.heartbeat),
                        subtitle: Text(baby.heartPulse!),
                      ),
                      Divider(),
                      ListTile(
                        title: Text("Baby Location"),
                        trailing: FaIcon(FontAwesomeIcons.locationArrow),
                        subtitle: Text("Press here to show location"),
                        onTap: () {
                          print("S");
                        },
                      ),
                      Divider(),
                      ListTile(
                        title: Text("Baby Live Camera"),
                        trailing: FaIcon(FontAwesomeIcons.camera),
                        subtitle: Text("Press here to show camera"),
                        onTap: () {
                          print("S");
                        },
                      ),
                      Divider(),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
