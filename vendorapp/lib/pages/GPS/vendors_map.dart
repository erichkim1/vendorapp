import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter/services.dart';
import 'package:vendorapp/pages/ReturningUser/review_appointment.dart';

class VendersMapPage extends StatefulWidget {
  @override
  _VendersMapPageState createState() => _VendersMapPageState();
}

class _VendersMapPageState extends State<VendersMapPage> {
  GoogleMapController _controller;
  Position position;
  LatLng latLng;
  Widget _widMap;
  //Marker marker;
  Circle circle;
  Set<Marker> _markers;

  Uint8List iconData;
  Uint8List homeIcon;
  String _iconDataPath = "assets/logos/sample_van_mini.PNG";
  String _homeIconPath = "assets/logos/groomurz_dog_logo.PNG";

  Location _locationTracker = Location();
  LatLng curLat = new LatLng(33.7357, -118.0346);

  List<String> venders = [
    'pet grooming A ... from 10 miles',
    'pet grooming B ... from 30 miles',
    'pet grooming C ... from 40 miles'
  ];

  //{'vender01', 'vender02'};

// this is for testing
  @override
  void initState() {
    getImageData();
    getCurrentLocation();
    super.initState();
    //moveMakers();
  }

  void getImageData() async {
    iconData = await getMarker(_iconDataPath);
    homeIcon = await getMarker(_homeIconPath);
  }

  void getCurrentLocation() async {
    Position res = await Geolocator().getCurrentPosition();

    CameraPosition pos =
        CameraPosition(target: LatLng(33.7357, -118.0346), zoom: 5);

    setState(() {
      position = res;
      //position = new LatLng(33.7357, -118.0346);
      _widMap = mapWidget2();
    });

    // moveMakers();
    // moveMakers2();
  }

  void moveMakers() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      setState(() {
        _widMap = mapWidget();
      });
    });
  }

  Future<Uint8List> getMarker(String path) async {
    //ByteData byteData = await DefaultAssetBundle.of(context).load("assets/logos/sample_van.jpg");
    ByteData byteData = await DefaultAssetBundle.of(context).load(path);
    return byteData.buffer.asUint8List();
  }

  // void updateMarkerAndCircle(Position pos, Uint8List imageData) {
  //   LatLng latLng = LatLng(pos.latitude, pos.longitude);
  //   this.setState(() {
  //     marker = Marker(
  //         markerId: MarkerId("home"),
  //         position: latLng,
  //         //rotation: newLocalData.heading,
  //         draggable: false,
  //         zIndex: 2,
  //         flat: true,
  //         anchor: Offset(0.5, 0.5),
  //         icon: BitmapDescriptor.fromBytes(imageData));
  //     circle = Circle(
  //         circleId: CircleId("car"),
  //         //radius: newLocalData.accuracy,
  //         zIndex: 1,
  //         strokeColor: Colors.blue,
  //         center: latLng,
  //         fillColor: Colors.blue.withAlpha(70));
  //   });
  // }

  Set<Marker> _createMarker(
      Uint8List vendorImageData, Uint8List homeImageData) {
    latLng = new LatLng(35.71, 139.8107);
    var latLngSec = new LatLng(35.74, 140.01);
    return <Marker>[
      Marker(
        markerId: MarkerId("marker00"),
        position: LatLng(curLat.latitude + 0.12, curLat.longitude - 0.012),
        rotation: position.heading + 0,
        //icon: BitmapDescriptor.defaultMarker,
        icon: BitmapDescriptor.fromBytes(vendorImageData),
        infoWindow: InfoWindow(
            //title: "InfoWindow GoogleMap",
            title: venders[1],
            onTap: () {
              print('inside of createMarker markerId: marker00');
            }),
      ),
      Marker(
        markerId: MarkerId("marker01"),
        position: LatLng(curLat.latitude - 0.03, curLat.longitude + 0.01),
        rotation: position.heading + 5,
        icon: BitmapDescriptor.fromBytes(vendorImageData),
        infoWindow: InfoWindow(
          title: venders[0],
        ),
      ),
      Marker(
        markerId: MarkerId("marker02"),
        position: LatLng(curLat.latitude + 0.12, curLat.longitude + 0.1),
        rotation: position.heading + 90,
        icon: BitmapDescriptor.fromBytes(vendorImageData),
        infoWindow: InfoWindow(
          title: venders[2],
        ),
      ),
      Marker(
        markerId: MarkerId("user"),
        position: curLat,
        rotation: position.heading,
        icon: BitmapDescriptor.defaultMarker,
        //icon: BitmapDescriptor.fromBytes(homeImageData),
        infoWindow: InfoWindow(
          title: 'Home',
        ),
      ),
    ].toSet();
  }

  @override
  Widget mapWidget() {
    //Set<Marker> crntMarkers = _createMarker(iconData);
    _markers = _createMarker(iconData, homeIcon);
    return GoogleMap(
      mapType: MapType.normal,
      //markers: _createMarker(iconData),
      markers: _markers,
      initialCameraPosition: CameraPosition(
          //target: LatLng(latLng.latitude, latLng.longitude), zoom: 12.0),
          target: LatLng(curLat.latitude, curLat.longitude),
          zoom: 11.0),
      onMapCreated: (GoogleMapController controller) {
        _controller = controller;
        _setGoogleMapStyle(controller);
      },
    );
  }

  Widget mapWidget2() {
    //Set<Marker> crntMarkers = _createMarker(iconData);
    _markers = _createMarker2(iconData);
    return GoogleMap(
      mapType: MapType.normal,
      //markers: _createMarker(iconData),
      markers: _markers,
      initialCameraPosition: CameraPosition(
          target: LatLng(curLat.latitude, curLat.longitude), zoom: 10.0),
      onMapCreated: (GoogleMapController controller) {
        _controller = controller;
        _setGoogleMapStyle(controller);
      },
    );
  }

  Set<Marker> _createMarker2(Uint8List imageData) {
    latLng = new LatLng(35.71, 139.8107);
    var latLngSec = new LatLng(35.74, 140.01);
    return <Marker>[
      Marker(
        markerId: MarkerId("marker00"),
        position: LatLng(curLat.latitude + 0.129, curLat.longitude - 0.0129),
        rotation: position.heading + 90,
        icon: BitmapDescriptor.fromBytes(imageData),
        infoWindow: InfoWindow(
            title: venders[0],
            onTap: () => {print('insdie of _createMarker2 marker00')}),
      ),
      Marker(
        markerId: MarkerId("marker01"),
        position: LatLng(curLat.latitude - 0.038, curLat.longitude + 0.02),
        rotation: position.heading + 5,
        icon: BitmapDescriptor.fromBytes(imageData),
        infoWindow: InfoWindow(
          title: "InfoWindow GoogleMap",
        ),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => ReviewAppointmentPage(),
          ),
        ),
      ),
      Marker(
        markerId: MarkerId("marker02"),
        position: LatLng(curLat.latitude + 0.125, curLat.longitude + 0.15),
        rotation: position.heading + 90,
        icon: BitmapDescriptor.fromBytes(imageData),
        infoWindow: InfoWindow(
          title: "InfoWindow GoogleMap",
        ),
      ),
      Marker(
        markerId: MarkerId("user"),
        position: curLat,
        rotation: position.heading,
        icon: BitmapDescriptor.defaultMarker,
        //icon: BitmapDescriptor.fromBytes(imageData),
        infoWindow: InfoWindow(
          title: venders[0],
        ),
      ),
    ].toSet();
  }

  void _setGoogleMapStyle(GoogleMapController controller) async {
    String value = await DefaultAssetBundle.of(context)
        .loadString('assets/googlemaps_style.json');
    controller.setMapStyle(value);
  }

  // this is for testing!
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('FIND YOUR GROOMER'),
      ),
      body: Container(
        decoration: BoxDecoration(
            border: Border.all(
          color: Colors.blueGrey,
          width: 0.0,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ConstrainedBox(
              constraints: BoxConstraints(
                  minWidth: size.width,
                  minHeight: size.height * 0.65,
                  maxHeight: size.height * 0.73),
              child: _widMap,
            ),
            /*
            ////////////////////////////////////////////////////////////////
            ConstrainedBox(
              constraints: BoxConstraints(
                  minWidth: size.width,
                  minHeight: size.height * 0.075,
                  maxHeight: size.height * 0.088),
              child: Container(
                  color: Colors.white,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: <Widget>[
                      Text('  ■　' + venders[0]),
                      new Padding(padding: new EdgeInsets.all(2.00)),
                      Text('  ■　' + venders[1]),
                      new Padding(padding: new EdgeInsets.all(2.00)),
                      Text('  ■　' + venders[2]),
                      new Padding(padding: new EdgeInsets.all(2.00)),
                      Text('  ■　Test...'),
                      new Padding(padding: new EdgeInsets.all(2.00)),
                      Text('  ■　Test...'),
                      new Padding(padding: new EdgeInsets.all(2.00)),
                      Text('  ■　Test...'),
                      new Padding(padding: new EdgeInsets.all(2.00)),
                      Text('  ■　Test...'),
                      new Padding(padding: new EdgeInsets.all(2.00)),
                    ],
                  )),
            ),
            ////////////////////////////////////////////////////////////////
            ConstrainedBox(
              constraints: BoxConstraints(
                  minWidth: size.width,
                  minHeight: size.height * 0.070,
                  maxHeight: size.height * 0.085),
              child: RaisedButton(
                padding: EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 20.0,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: Text('Appointment'),
                color: Colors.deepOrange[400],
                highlightColor: Colors.deepOrange[600],
                textColor: Colors.white,
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      //builder: (BuildContext context) => createPassword(),
                      ),
                ),
              ),
            ),
            */
          ],
        ),
      ),
    );
  }
}
