import 'package:bi_tracer/shared/auth_button.dart';
import 'package:bi_tracer/shared/constants.dart';
import 'package:bi_tracer/shared/textfield.dart';
import 'package:bi_tracer/shared/validation.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController motherName;
  late TextEditingController fatherName;
  late TextEditingController motherPhone;
  late TextEditingController fatherPhone;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController confirmPassword;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    motherName = TextEditingController();
    fatherName = TextEditingController();
    motherPhone = TextEditingController();
    fatherPhone = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    confirmPassword = TextEditingController();
  }

  @override
  void dispose() {
    motherName.dispose();
    fatherName.dispose();
    motherPhone.dispose();
    fatherPhone.dispose();
    email.dispose();
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LoginTextField(
                    controller: motherName,
                    keyboardType: TextInputType.name,
                    label: "Mother Name",
                    validate: Validation().defaultValidation),
                SizedBox(
                  height: 15,
                ),
                LoginTextField(
                    controller: fatherName,
                    keyboardType: TextInputType.name,
                    label: " Father Name",
                    validate: Validation().defaultValidation),
                SizedBox(
                  height: 15,
                ),
                LoginTextField(
                    controller: motherPhone,
                    keyboardType: TextInputType.phone,
                    label: "Mother Phone Number",
                    validate: Validation().defaultValidation),
                SizedBox(
                  height: 15,
                ),
                LoginTextField(
                    controller: fatherPhone,
                    keyboardType: TextInputType.phone,
                    label: "Father Phone Number",
                    validate: Validation().defaultValidation),
                SizedBox(
                  height: 15,
                ),
                LoginTextField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    label: "Email",
                    validate: Validation().emailValidation),
                SizedBox(
                  height: 15,
                ),
                LoginTextField(
                    controller: password,
                    keyboardType: TextInputType.visiblePassword,
                    label: "Password",
                    validate: Validation().passwordValidation),
                SizedBox(
                  height: 15,
                ),
                LoginTextField(
                    controller: confirmPassword,
                    keyboardType: TextInputType.visiblePassword,
                    label: "Confirm Password",
                    validate: (s) {
                      return Validation()
                          .confirmPasswordValidation(s, password.text);
                    }),
                SizedBox(
                  height: 15,
                ),
                MaterialButtonDesign(
                    pressed: () {
                      if (formKey.currentState!.validate()) {
                        print("S");
                      }
                    },
                    minWidth: double.infinity,
                    color: mainColor,
                    label: "Register"),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
