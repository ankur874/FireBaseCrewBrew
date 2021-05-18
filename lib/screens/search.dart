import 'package:firebase_crew_brew/services/database.dart';
import 'package:firebase_crew_brew/widgets/SearchList.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/icon.png',
          height: 50.0,
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: SearchList());
              }),
        ],
      ),
    );
  }
}
