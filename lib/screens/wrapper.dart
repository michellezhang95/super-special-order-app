import 'package:flutter/material.dart';
import 'package:orderingapp/authenticate/authenticate.dart';
import 'package:orderingapp/home/home.dart';
import 'package:provider/provider.dart';
import 'package:orderingapp/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //access user data from provider every time user auth changes
    final user = Provider.of<User>(context);
    //if null go to login screen else go to dashboard
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
    //return either home or authenticate widget
  }
}
