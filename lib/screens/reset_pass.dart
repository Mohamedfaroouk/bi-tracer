import 'package:bi_tracer/shared/auth_button.dart';
import 'package:bi_tracer/shared/constants.dart';
import 'package:bi_tracer/shared/textfield.dart';
import 'package:bi_tracer/shared/validation.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController restPassword;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    restPassword = TextEditingController();
  }

  @override
  void dispose() {
    restPassword.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reset Password"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoginTextField(
                  controller: restPassword,
                  keyboardType: TextInputType.visiblePassword,
                  label: "Confirm Password",
                  validate: Validation().passwordValidation),
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
                  label: "Reset"),
            ],
          ),
        ),
      ),
    );
  }
}
