import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crew_brew/modal/user.dart';
import 'package:flutter/material.dart';

class AuthMethod {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  UserClass _userFromFireBase(User user) {
    return user != null ? UserClass(userId: user.uid) : null;
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userDetails = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return _userFromFireBase(userDetails.user);
    } catch (e) {
      print(e);
    }
  }

  Future signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userDetails = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return _userFromFireBase(userDetails.user);
    } catch (e) {
      print(e.toString());
    }
  }

  Future resetPassword(String email) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e.toString());
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
