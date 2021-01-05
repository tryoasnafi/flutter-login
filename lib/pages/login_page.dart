import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 24.0, top: 100.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Let's sign you in.",
                  style: TextStyle(
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Welcome back.",
                  style: TextStyle(
                    fontSize: 28.0,
                  ),
                ),
                Text(
                  "You've been missed!",
                  style: TextStyle(
                    fontSize: 28.0,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 50),
            padding: EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'E-Mail Address',
                      border: OutlineInputBorder(borderSide: BorderSide()),
                    ),
                    validator: (val) => val.length == 0 ? 'Enter Name' : null,
                  ),
                  SizedBox(height: 18,),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(borderSide: BorderSide()),
                    ),
                    obscureText: true,
                    validator: (val) => val.length == 0 ? 'Enter Name' : null,
                  ),
                  SizedBox(height: 60,),
                  MaterialButton(
                    onPressed: () {},
                    child: Text(
                      'Log In',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    color: Colors.green,
                    elevation: 5,
                    textColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 18.0),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  SizedBox(height: 6,),
                  Text(
                    "or",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 6,),
                  MaterialButton(
                    onPressed: () {},
                    child: Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    color: Colors.white,
                    elevation: 5,
                    padding: EdgeInsets.symmetric(vertical: 18.0),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
