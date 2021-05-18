import 'package:firebase_crew_brew/screens/search.dart';
import 'package:firebase_crew_brew/screens/signIn.dart';
import 'package:firebase_crew_brew/services/auth.dart';
import 'package:flutter/material.dart';

class ChatRoom extends StatefulWidget {
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  AuthMethod _authMethod = new AuthMethod();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/icon.png',
          height: 50.0,
        ),
        actions: [
          GestureDetector(
            onTap: () {
              _authMethod.signOut();
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => SignIn()));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Icon(Icons.logout),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SearchScreen()));
        },
      ),
    );
  }
}
