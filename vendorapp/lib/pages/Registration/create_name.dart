// This is for testing
// Purpose of this page is to create a form that accepts name

import 'package:flutter/material.dart';
import 'package:vendorapp/pages/Registration/create_password.dart';

class createName extends StatefulWidget {
  createName({Key key, @required this.email, @required this.phone})
      : super(key: key);
  String email;
  String phone;
  @override
  _createName createState() => _createName();
}

class _createName extends State<createName> {
  String _firstName = '';
  String _lastName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MobilePetGrooming'),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 0.0),
        decoration: BoxDecoration(),
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(height: 70),
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
                    labelText: 'First Name',
                    hintText: 'Enter your First Name',
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
                    setState(() => _firstName = value);
                  },
                ),
              ),
              SizedBox(height: 50),
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
                    labelText: 'Last Name',
                    hintText: 'Enter your Last Name',
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
                    setState(() => _lastName = value);
                  },
                ),
              ),
              SizedBox(height: 150),
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
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => createPassword(
                          email: widget.email,
                          phone: widget.phone,
                          firstName: _firstName,
                          lastName: _lastName),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
