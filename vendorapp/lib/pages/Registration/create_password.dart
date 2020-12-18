// This is for testing
// Purpose of this page is to create a form that accepts name

import 'package:flutter/material.dart';
import 'package:vendorapp/pages/Registration/add_profpicture.dart';
import 'package:vendorapp/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class createPassword extends StatefulWidget {
  createPassword(
      {Key key,
      @required this.email,
      @required this.phone,
      @required this.firstName,
      @required this.lastName})
      : super(key: key);
  String email;
  String phone;
  String firstName;
  String lastName;
  @override
  _createPassword createState() => _createPassword();
}

class _createPassword extends State<createPassword> {
  Firestore _db = Firestore.instance;
  String _password = '';
  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();

    return Scaffold(
      appBar: AppBar(
        title: Text('MobilePetGrooming'),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ConstrainedBox(
              constraints: BoxConstraints(
                  minWidth: 320.0, minHeight: 24.0, maxHeight: 100.0),
              child: TextField(
                  enabled: true,
                  maxLength: 32,
                  style: TextStyle(color: Colors.blue),
                  obscureText: false,
                  maxLines: 1,
                  decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Enter your Password",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 45,
                      vertical: 20,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(28),
                      borderSide: BorderSide(color: Colors.grey[300]),
                      gapPadding: 10,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() => _password = value);
                    print(widget.email);
                    print(widget.phone);
                    print(widget.firstName);
                    print(widget.lastName);
                    print(_password);
                  }),
            ),
            SizedBox(
              width: double.infinity,
              child: RaisedButton(
                padding: EdgeInsets.symmetric(
                  vertical: 20.0,
                  horizontal: 20.0,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: Text('Continue'),
                color: Colors.blue[400],
                highlightColor: Colors.blue[600],
                textColor: Colors.white,
                onPressed: () {
                  Map<String, String> testUserProfile = {
                    'firstName': widget.firstName,
                    'lastName': widget.lastName,
                    'phone': widget.phone,
                    'email': widget.email,
                    'password': _password
                  };
                  _auth.registerWithEmailAndPassword(widget.email, _password);
                  addUser(testUserProfile);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => AddProfPicture(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // you can pass in document(uniqueID) if you want to generate your own uniqueID,
  // however, if you leave it blank, then it will auto-generate unique ID for you
  Future<void> addUser(Map data) {
    return _db.collection('testUserProfile').document().setData(data);
  }
}
