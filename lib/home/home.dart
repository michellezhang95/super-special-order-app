import 'package:flutter/material.dart';
import 'package:orderingapp/services/auth.dart';
import 'package:orderingapp/services/database.dart';
import 'package:provider/provider.dart';
import 'package:orderingapp/home/brew_list.dart';
import 'package:orderingapp/models/brew.dart';
import 'package:orderingapp/home/settings_form.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  //
  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: SettingsForm(),
            );
          });
    }

    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Super Order'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(Icons.person),
              label: Text('logout'),
            ),
            FlatButton.icon(
                onPressed: () => _showSettingsPanel(),
                icon: Icon(Icons.settings),
                label: Text('settings')),
          ],
        ),
        body: BrewList(),
      ),
    );
  }
}
