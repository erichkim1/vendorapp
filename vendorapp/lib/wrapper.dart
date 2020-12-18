import 'package:flutter/material.dart';
import 'package:vendorapp/pages/GPS/googlemap.dart';
import 'package:vendorapp/pages/GPS/main_map.dart';
import 'package:vendorapp/pages/GPS/venders_map.dart';
import 'package:provider/provider.dart';
import 'Models/user.dart';
import 'package:vendorapp/pages/Registration/create_profile.dart';
import 'pages/ReturningUser/welcom_back_page.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    // return either Home or Authenticate widget

    if (user == null) {
      // needs to sign in. so take the user to the sign in page
      print('User is not logged in');
      print('User needs to sign in');
      //return WelcomeBackPage();
      return CreateProfile();
      //return VendersMapPage();
      //return MainMap();
    } else {
      print('User is logged in!');
      print('User Id: ' + user.uid);
      return WelcomeBackPage();
    }
  }
}
