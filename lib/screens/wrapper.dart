import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'onboard/onboard.dart';
import '../shared/navigation/nav_bar.dart';
import '../screens/authenticate/authenticate.dart';
import '../models/user.dart';

class Wrapper extends StatelessWidget {
  final SharedPreferences sharedPrefs;
  const Wrapper(this.sharedPrefs, {super.key});

  @override
  Widget build(BuildContext context) {
    var initialLoad = sharedPrefs.getBool('initialLoad');
    print("PREFS RECEIVED FOR STATUS -> ${sharedPrefs.getBool('initialLoad')}");

    //Retrieve USER object from StreamProvider in main.dart
    final user = Provider.of<CurrentUser?>(context);
    print("user$user");

    // if (initialLoad!) {
    //   return Onboard(sharedPrefs);
    // } else {
    //Not logged inR

    if (user == null) {
      print(Authenticate());
      return Authenticate();
    } else {
      print("R");
      return NavBarLayout(user: user);
    }
  }
  // }
}
