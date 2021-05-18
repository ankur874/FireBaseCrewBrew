import 'package:firebase_crew_brew/screens/signUp.dart';
import 'package:firebase_crew_brew/widgets/appbar.dart';
import 'package:firebase_crew_brew/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
        alignment: Alignment.bottomCenter,
        child: ListView(
          shrinkWrap: true,
          children: [
            TextField(
              keyboardType: TextInputType.emailAddress,
              style: ktextStyle(),
              decoration: ktextFieldDecoration("Email"),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              style: ktextStyle(),
              decoration: ktextFieldDecoration("Password"),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.lightBlue,
              ),
              width: MediaQuery.of(context).size.width,
              child: Text(
                'Sign In',
                textAlign: TextAlign.center,
                style: ktextStyle().copyWith(fontSize: 18.0),
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.white),
              width: MediaQuery.of(context).size.width,
              child: Text(
                'Sign In with Google',
                textAlign: TextAlign.center,
                style:
                    ktextStyle().copyWith(fontSize: 18.0, color: Colors.black),
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: ktextStyle().copyWith(fontSize: 15.0),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>Signup()));
                  },
                  child: Text(
                    "Register now",
                    style: ktextStyle().copyWith(
                        fontSize: 15.0, decoration: TextDecoration.underline),
                  ),
                )
              ],
            ),
            SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}
