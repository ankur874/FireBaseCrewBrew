import 'package:firebase_crew_brew/screens/chatRooms.dart';
import 'package:firebase_crew_brew/services/auth.dart';
import 'package:firebase_crew_brew/services/database.dart';
import 'package:firebase_crew_brew/widgets/appbar.dart';
import 'package:flutter/material.dart';
import '../widgets/constants.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final formKey = GlobalKey<FormState>();

  TextEditingController userNameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  DataBaseMethods dataBaseMethods = new DataBaseMethods();
  bool isLoading = false;
  AuthMethod authMethod = new AuthMethod();
  signMeUp() {
    if (formKey.currentState.validate()) {
      authMethod
          .signUpWithEmailAndPassword(
              emailController.text, passwordController.text)
          .then((value) => print(value));
      Map<String, String> dataMap = {
        "email": emailController.text,
        "name": userNameController.text,
      };
      dataBaseMethods.uploadUserInfo(dataMap);
      setState(() {
        isLoading = true;
      });
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => ChatRoom()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Container(
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
              alignment: Alignment.bottomCenter,
              child: ListView(
                shrinkWrap: true,
                children: [
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (val) {
                            return RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(val)
                                ? null
                                : "Enter valid email address.";
                          },
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          style: ktextStyle(),
                          decoration: ktextFieldDecoration("Email"),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          validator: (val) {
                            return val.length < 6 || val.length > 20
                                ? "Password should be between 4 and 20 characters long."
                                : null;
                          },
                          controller: passwordController,
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                          style: ktextStyle(),
                          decoration: ktextFieldDecoration("Password"),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          validator: (val) {
                            return val.length < 5 || val.isEmpty
                                ? "Enter valid username."
                                : null;
                          },
                          controller: userNameController,
                          keyboardType: TextInputType.visiblePassword,
                          style: ktextStyle(),
                          decoration: ktextFieldDecoration("Username"),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(height: 16.0),
                  GestureDetector(
                    onTap: () {
                      signMeUp();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.lightBlue,
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        'Sign up',
                        textAlign: TextAlign.center,
                        style: ktextStyle().copyWith(fontSize: 18.0),
                      ),
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
                      'Sign up with Google',
                      textAlign: TextAlign.center,
                      style: ktextStyle()
                          .copyWith(fontSize: 18.0, color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: ktextStyle().copyWith(fontSize: 15.0),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Log In",
                          style: ktextStyle().copyWith(
                              fontSize: 15.0,
                              decoration: TextDecoration.underline),
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
