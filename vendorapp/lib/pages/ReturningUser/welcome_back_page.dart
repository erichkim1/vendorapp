import 'package:flutter/material.dart';
//import 'package:mobilepetgrooming/googlemap.dart';
import 'package:vendorapp/pages/Registration/email_phone.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vendorapp/services/auth.dart';
import 'package:vendorapp/pages/ReturningUser/sign_in.dart';
import 'package:vendorapp/pages/ReturningUser/booking_service.dart';

class WelcomeBackPage extends StatefulWidget {
  @override
  _WelcomeBackPageState createState() => _WelcomeBackPageState();
}

class _WelcomeBackPageState extends State<WelcomeBackPage> {
  Firestore _db = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white24,
            width: 3.0,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: 640.0,
                minHeight: 220.0,
                maxHeight: 320,
              ),
              child: Image.asset('lib/Logos/groomurz_logo.jpg'),
            ),
            // for the buttons
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                    bottom: 20.0,
                    top: 20.0,
                  ),
                  child: Text(
                    'Welcome Back ',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 5.0,
                    horizontal: 80.0,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      padding: EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 40.0,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Text('Book Service'),
                      color: Colors.blue[400],
                      highlightColor: Colors.blue[600],
                      textColor: Colors.white,
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              BookingServicePage(),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 5.0,
                    horizontal: 80.0,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                        padding: EdgeInsets.symmetric(
                          vertical: 20.0,
                          horizontal: 40.0,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Text(
                          'Sign In with Different Account',
                          textAlign: TextAlign.center,
                        ),
                        color: Colors.blue[400],
                        highlightColor: Colors.blue[600],
                        textColor: Colors.white,
                        onPressed: () {
                          _auth.signOut();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => SignIn(),
                            ),
                          );
                        }),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> getUserName() {
    CollectionReference collectionReference =
        Firestore.instance.collection('testUserProfile');
  }

  Future<void> addUser(String uniqueId, Map data) {
    return _db.collection('testUser').document(uniqueId).setData(data);
  }
}
