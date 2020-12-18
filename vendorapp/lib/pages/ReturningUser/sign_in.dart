import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vendorapp/services/auth.dart';
import 'package:http/http.dart' as http;
import 'package:vendorapp/pages/ReturningUser/welcome_back_page.dart';
import 'package:vendorapp/pages/Registration/email_phone.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  Firestore _db = Firestore.instance;
  // this is used to keep track of the current form state
  final _formKey = GlobalKey<FormState>();

  // text field State
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Sign In'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Register'),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => EmailAndPhone(),
              ),
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 0.0),
        decoration: BoxDecoration(),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(height: 70),
                ConstrainedBox(
                  constraints: BoxConstraints(
                      minWidth: 320.0, minHeight: 24.0, maxHeight: 100.0),
                  child: TextFormField(
                    enabled: true,
                    maxLength: 32,
                    style: TextStyle(color: Colors.blue),
                    obscureText: false,
                    maxLines: 1,
                    decoration: InputDecoration(
                      labelText: 'Enter your email',
                      hintText: 'E-mail Address',
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
                    validator: (val) => val.isEmpty ? 'Enter an email' : null,
                    onChanged: (val) {
                      testHttp();
                      setState(() => email = val);
                    },
                  ),
                ),
                SizedBox(height: 50),
                ConstrainedBox(
                  constraints: BoxConstraints(
                      minWidth: 320.0, minHeight: 24.0, maxHeight: 100.0),
                  child: TextFormField(
                    enabled: true,
                    maxLength: 32,
                    style: TextStyle(color: Colors.blue),
                    obscureText: false,
                    maxLines: 1,
                    decoration: InputDecoration(
                      labelText: 'Enter your Password',
                      hintText: 'Password',
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
                    validator: (val) => val.length < 6
                        ? 'Enter a password 6 + characters long'
                        : null,
                    onChanged: (val) {
                      setState(() => password = val);
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
                    onPressed: () async {
                      print('email: ' + email);
                      print('password: ' + password);
                      if (_formKey.currentState.validate()) {
                        print('email: ' + email);
                        print('password: ' + password);
                        dynamic result = await _auth.signInWithEmailAndPassword(
                            email, password);

                        if (result == null) {
                          setState(() => error =
                              'Could not sign in with the given credentials');
                        } else {
                          print('Successfully Signed In');
                        }
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  WelcomeBackPage()),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> addUser(String uniqueId, Map data) {
    return _db.collection('testUser').document(uniqueId).setData(data);
  }

  Future<void> testHttp() async {
    final response = await http
        .get('https://us-central1-groomurz.cloudfunctions.net/randomNumber');

    if (response.statusCode == 200) {
      print('http request returned 200!');
      print(response);
      print('random number: ' + response.body);
    } else {
      print('http request encountered error code: ' +
          response.statusCode.toString());
    }
  }
}
