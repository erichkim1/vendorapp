import 'package:flutter/material.dart';
import 'package:vendorapp/Models/service_list.dart';
import 'package:provider/provider.dart';
import 'package:vendorapp/Models/petService.dart';
import 'package:vendorapp/Models/service_list.dart';
import 'package:vendorapp/pages/GPS/vendors_map.dart';

class BookingServicePage extends StatefulWidget {
  @override
  _BookingServiceState createState() => _BookingServiceState();
}

class _BookingServiceState extends State<BookingServicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Service'),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
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
                  'Choose your Service',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              FlatButton(
                padding: EdgeInsets.all(0.0),
                child: Image.asset('assets/services/DogService1.PNG'),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => VendersMapPage(),
                    // ChooseServicePage(),
                  ),
                ),
              ),
              SizedBox(height: 50),
              FlatButton(
                padding: EdgeInsets.all(0.0),
                child: Image.asset('assets/services/DogService2.PNG'),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => VendersMapPage(),
                    // ChooseServicePage(),
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
