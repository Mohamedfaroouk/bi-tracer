import 'dart:async';

import 'package:bi_tracer/firebase/auth.dart';
import 'package:bi_tracer/screens/login.dart';
import 'package:bi_tracer/shared/navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 2), () {
      FirebaseAuth.instance.authStateChanges().listen((User? user) async {
        if (user == null) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LogIn()));
        } else {
          // Navigator.pushReplacementNamed(context, FirstScreen.id);

          checkLog(context, user.uid);

          //  print('User is signed in!');
        }
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "images/logo.png",
            filterQuality: FilterQuality.high,
            height: 200,
          ),
          CircularProgressIndicator()
        ],
      ),
    ));
  }
}
