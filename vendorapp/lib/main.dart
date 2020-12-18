import 'common/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendorapp/Models/local_preferencces.dart';
import 'package:vendorapp/Models/user.dart';
import 'package:vendorapp/pages/payment/payment_options.dart';
import 'package:vendorapp/services/auth.dart';
import 'wrapper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().checkIfUserIsLoggedIn,
      child: MaterialApp(
        home: Wrapper(),
        theme: appTheme,
        routes: {
          '/home': (context) => PaymentOptions(),
          /*
          '/main_map': (context) => MainMap(),
          '/login_page': (context) => LoginPage(),
          '/layouttest': (context) => LayoutTestPage(),
          '/create_prof': (context) => CreateProfile(),
          '/welcome_back': (context) => WelcomeBackPage(),
          */
        },
      ),
    );
  }

  bool isCreateProfMode() {
    Preferences pref = Preferences();
    if (pref.getPrefItem('RunMode') == 'RegistrationMode')
      return true;
    else
      return false;
  }
}
