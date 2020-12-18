import 'package:flutter/material.dart';
import 'package:vendorapp/pages/Registration/email_phone.dart';
import 'package:vendorapp/pages/ReturningUser/sign_in.dart';

class CreateProfile extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreateProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            border: Border.all(
          color: Colors.white24,
          width: 3.0,
        )),
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
                        child: Text('Register New Account'),
                        color: Colors.blue[400],
                        highlightColor: Colors.blue[600],
                        textColor: Colors.white,
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => EmailAndPhone(),
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
                        child: Text('Login'),
                        color: Colors.blue[400],
                        highlightColor: Colors.blue[600],
                        textColor: Colors.white,
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => SignIn(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  /*
                  RaisedButton(
                      child: Text('Login'),
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.redAccent,
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => SignIn(),
                          ))), */
                ],
              )
            ]),
      ),
    );
  }
}
