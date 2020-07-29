import 'package:flutter/material.dart';
import 'package:orderingapp/services/auth.dart';
import 'package:orderingapp/shared/constants.dart';
import 'package:orderingapp/shared/constants.dart';
import 'package:orderingapp/shared/loading.dart';

class Register extends StatefulWidget {
  //constructor

  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>(); //used for form validation
  bool loading = false;
  //text field state
  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.brown[100],
            appBar: AppBar(
              backgroundColor: Colors.brown[400],
              elevation: 0.0,
              title: Text('Register to Ordering App'),
              actions: <Widget>[
                FlatButton.icon(
                  onPressed: () async {
                    widget.toggleView();
                  },
                  icon: Icon(Icons.person),
                  label: Text('Sign In'),
                )
              ],
            ),
            body: Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 20.0),
                      //inpt for email
                      TextFormField(
                          decoration:
                              textInputDecoration.copyWith(hintText: 'Email'),
                          validator: (val) =>
                              val.isEmpty ? 'Enter an email' : null,
                          onChanged: (val) {
                            setState(() => email = val);
                          }),
                      SizedBox(height: 20.0),
                      TextFormField(
                        decoration:
                            textInputDecoration.copyWith(hintText: 'Password'),
                        validator: (val) => val.length < 6
                            ? 'Enter an password 6+ chars long'
                            : null,
                        //hides password input
                        obscureText: true,
                        onChanged: (pval) {
                          setState(() => password = pval);
                        },
                      ),
                      SizedBox(height: 20.0),
                      RaisedButton(
                          color: Colors.pink[400],
                          child: Text(
                            'Register',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState
                                .validate()) //validate form based on state
                            {
                              setState(() => loading = true);
                              dynamic result =
                                  await _auth.registerWithEmailAndPassword(
                                      email, password);
                              if (result == null) {
                                setState(() {
                                  error = 'Please enter valid email';
                                  loading = false;
                                });
                              }
                            } else {}
                          }),
                      SizedBox(height: 12.0),
                      Text(error,
                          style: TextStyle(color: Colors.red, fontSize: 14.0)),
                    ],
                  ),
                )));
  }
}
