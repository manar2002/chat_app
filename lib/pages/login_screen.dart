import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/pages/signup_screen.dart';
import 'package:flutter_application_1/widgets/custom_button.dart';
import 'package:flutter_application_1/widgets/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  static String id = "Login Screen";
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(splashScreen),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "ScholarChat",
              style: TextStyle(
                color: kPrimaryColorWhite,
                fontSize: 30,
                fontFamily: "pacifico",
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Sign In",
                  style: TextStyle(
                    color: kPrimaryColorWhite,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            CustomTextField(
              hintText: "Email",
              onChanged: (data)=> email = data,
            ),
            SizedBox(
              height: 20.0,
            ),
            CustomTextField(
              hintText: "Password",
              onChanged: (data)=> password = data,
            ),
            SizedBox(
              height: 25,
            ),
            CustomButton(text: "Sign In",
              onTap: () async{
                try {
                  await loginUser();
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    SnackBar(content: Text('No user found for that email.'));
                  } else if (e.code == 'wrong-password') {
                    SnackBar(content: Text('Wrong password provided for that user.'));
                  }
                }
              },
            ),
            SizedBox(
              height: 8.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account ? ",
                  style: TextStyle(
                    color: kPrimaryColorWhite,
                    fontSize: 17.0,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, SignUpScreen.id);
                  },
                  child: Text(
                    "  Register",
                    style: TextStyle(
                      color: kPrimaryColorLightBlue,
                      fontSize: 17.0,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> loginUser() async {
     final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email!,
        password: password!
    );
  }
}