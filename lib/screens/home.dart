import 'package:bi_tracer/models/mother_model.dart';
import 'package:bi_tracer/screens/babies.dart';
import 'package:bi_tracer/screens/doctors.dart';
import 'package:bi_tracer/screens/mothers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    Mothers(),
    Doctors(),
   Babies()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //  backgroundColor: Colors.white,

      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.deepPurple,
              hoverColor: Colors.deepPurple,
              gap: 8,
              activeColor: Colors.white,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.deepPurple,
              color: Colors.black,
              tabs: [
                GButton(
                  icon: FontAwesomeIcons.female,
                  text: 'Mothers',
                ),
                GButton(
                  icon: FontAwesomeIcons.userMd,
                  text: 'Doctors',
                ),
                GButton(
                  icon: FontAwesomeIcons.baby,
                  text: 'Babies',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}