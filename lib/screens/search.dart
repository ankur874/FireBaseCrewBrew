import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crew_brew/services/database.dart';
import 'package:firebase_crew_brew/widgets/constants.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  final String username;

  const SearchScreen({Key key, this.username}) : super(key: key);
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  DataBaseMethods dataBaseMethods = new DataBaseMethods();
  TextEditingController searchUsernameController = new TextEditingController();
  QuerySnapshot searchVal;
  createChatRoomConversation() {
   // dataBaseMethods.createChatRoom(chatRoomId, chatRoomMap);
  }

  void getUsername() {
    dataBaseMethods
        .getUserByUsername(searchUsernameController.text)
        .then((value) {
      setState(() {
        searchVal = value;
      });
    });
  }

  Widget searchList() {
    return searchVal != null
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: searchVal.docs.length,
            itemBuilder: (context, index) {
              return nameTile(
                userEmail: searchVal.docs[index].get("email"),
                userName: searchVal.docs[index].get("name"),
              );
            })
        : Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/icon.png',
          height: 50.0,
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                        style: TextStyle(color: Colors.white),
                        controller: searchUsernameController,
                        decoration: ktextFieldDecoration("Enter Username..")),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      getUsername();
                    },
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            searchList(),
          ],
        ),
      ),
    );
  }
}

class nameTile extends StatelessWidget {
  final String userName;
  final String userEmail;
  const nameTile({Key key, this.userName, this.userEmail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                userName,
                style: ktextStyle(),
              ),
              Text(
                userEmail,
                style: ktextStyle().copyWith(color: Colors.white),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(30),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Center(
              child: Icon(
                Icons.send,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
