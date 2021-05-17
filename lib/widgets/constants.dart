import 'package:flutter/material.dart';

InputDecoration ktextFieldDecoration(String hintText) {
  return InputDecoration(
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: BorderSide(color: Colors.white)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50.0),
        borderSide: BorderSide(
          color: Colors.white60,
        ),
      ),
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.white54));
}

TextStyle ktextStyle() {
  return TextStyle(
    color: Colors.white,
  );
}
