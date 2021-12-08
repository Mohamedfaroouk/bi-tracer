import 'package:bi_tracer/shared/auth_button.dart';
import 'package:bi_tracer/shared/constants.dart';
import 'package:bi_tracer/shared/textfield.dart';
import 'package:bi_tracer/shared/validation.dart';
import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 200,
                    child: Image.asset('images/logo.png'),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              LoginTextField(
                keyboardType: TextInputType.emailAddress,
                label: 'Enter Email',
                controller: emailController,
                suffixIcon: Icon(
                  Icons.email,
                  color: Colors.black,
                ),
                validate: Validation().emailValidation,
              ),
              SizedBox(
                height: 15,
              ),
              LoginTextField(
                keyboardType: TextInputType.visiblePassword,
                label: 'Enter Password',
                controller: passController,
                validate: Validation().passwordValidation,
              ),
              SizedBox(
                height: 15,
              ),
              MaterialButtonDesign(
                  pressed: () {},
                  minWidth: 250,
                  color: mainColor,
                  label: 'Login')
            ],
          ),
        ),
      ),
    );
  }
}
