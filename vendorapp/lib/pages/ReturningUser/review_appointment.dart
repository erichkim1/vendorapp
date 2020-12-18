import 'package:flutter/material.dart';
import 'package:vendorapp/pages/Registration/create_password.dart';
import 'package:vendorapp/pages/payment/payment_options.dart';

class ReviewAppointmentPage extends StatefulWidget {
  @override
  _ReviewAppointmentState createState() => _ReviewAppointmentState();
}

class _ReviewAppointmentState extends State<ReviewAppointmentPage> {
  String _firstName = '';
  String _lastName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('REVIEW APPOINTMENT'),
        textTheme: TextTheme(
            title: TextStyle(
          fontSize: 18.0,
        )),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Payment'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => PaymentOptions(),
                ),
              );
            },
          )
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  left: 20.0,
                  right: 267.0,
                  bottom: 20.0,
                  top: 20.0,
                ),
                child: Text(
                  'Service',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.only(
                  left: 20.0,
                  right: 250.0,
                  bottom: 20.0,
                  top: 20.0,
                ),
                child: Text(
                  'Groomer',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
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
                  /* onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              BookingServicePage(),
                        ),
                      ), */
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
