import 'package:firebase_crew_brew/services/database.dart';
import 'package:flutter/material.dart';

class SearchList extends SearchDelegate {
  

  @override
  String get searchFieldLabel => searchFieldText();
  String searchFieldText() {
    return "Search..";
  }

  @override
  TextStyle get searchFieldStyle => searchStyle();
  TextStyle searchStyle() {
    return TextStyle(
      fontWeight: FontWeight.normal,
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
