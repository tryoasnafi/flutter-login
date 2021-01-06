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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 24.0, top: 80.0),
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
              margin: EdgeInsets.only(top: 32),
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
                        hintText: 'email@example.com',
                      ),
                      validator: (val) => val.length == 0 ? 'Please enter your e-mail' : null,
                    ),
                    SizedBox(height: 18,),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(borderSide: BorderSide()),
                        hintText: 'Enter password',
                      ),
                      obscureText: true,
                      validator: (val) => val.length == 0 ? 'Please enter a password' : null,
                    ),
                    SizedBox(height: 48,),
                    // Log-in Button
                    MaterialButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {

                        }
                      },
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
                    // Register Button
                    MaterialButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/register',
                        );
                      },
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
      ),
    );
  }
}
