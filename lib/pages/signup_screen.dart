import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/widgets/custom_button.dart';
import 'package:flutter_application_1/widgets/custom_textfield.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  static String id = "SignUpScreen";

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
            SizedBox(height: 25.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Sign Up",
                  style: TextStyle(
                    color: kPrimaryColorWhite,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0,),
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
            CustomButton(text: "Sign Up",
              onTap: () async{
                try {
                  await registerUser();
                  SnackBar(content: Text('Success',));
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    SnackBar(content: Text('The password provided is too weak.'));

                  } else if (e.code == 'email-already-in-use') {
                    SnackBar(content: Text('The account already exists for that email.'));
                  }
                } catch (e) {
                  print(e);
                }
              },
            ),
            SizedBox(
              height: 8.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("already have an account ? ",
                  style: TextStyle(
                    color: kPrimaryColorWhite,
                    fontSize: 17.0,
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Text("  Login",
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

  Future<void> registerUser() async {
     final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}