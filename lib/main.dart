import 'package:bi_tracer/screens/login.dart';
import 'package:bi_tracer/screens/mother_details.dart';
import 'package:bi_tracer/screens/register_mother.dart';
import 'package:bi_tracer/screens/reset_pass.dart';
import 'package:bi_tracer/shared/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bi-Tracer',
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              color: Colors.transparent,
              titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.black)),
          scaffoldBackgroundColor: backgroundColor,
          primarySwatch: mainColor),
      home: MotherDetails(),
    );
  }
}
