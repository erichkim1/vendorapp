import 'package:flutter/material.dart';
import 'package:vendorapp/pages/Registration/create_name.dart';

class EmailAndPhone extends StatefulWidget {
  @override
  _emailAndPhone createState() => _emailAndPhone();
}

class _emailAndPhone extends State<EmailAndPhone> {
  String _email = '';
  String _phone = '';

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
                      labelText: 'E-mail',
                      hintText: 'Enter your E-mail',
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
                      setState(() => _email = value);
                    }),
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
                      labelText: 'Phone Number',
                      hintText: 'Enter your Phone Number',
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
                      setState(() => _phone = value);
                    }),
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
                      builder: (BuildContext context) => createName(
                        email: _email,
                        phone: _phone,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
