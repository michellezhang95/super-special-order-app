import 'package:flutter/material.dart';
import 'package:orderingapp/screens/wrapper.dart';
import 'package:orderingapp/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:orderingapp/models/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //stream provider wrap, children can access provider values
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
