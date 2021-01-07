import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_login/models/user.dart';
import 'package:flutter_login/pages/login/login_response.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> implements LoginCallBack{
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  String email, password;
  
  LoginResponse _response;

  _LoginPageState() {
    _response = LoginResponse(this);
  }

  // Redirect to register page
  void _register() => Navigator.of(context).pushNamed('/register');

  void _submit() {
    final form = _formKey.currentState;
    if (form.validate()) {
      setState(() {
        form.save();
        _response.doLogin(email, password);
      });
    }
  }

  void _showSnackBar(String text) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(text),
    ));
  }

  String _validateEmail(String value) {
    Pattern pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = new RegExp(pattern);
    return (!regex.hasMatch(value) || value == null) ? 'Enter a valid email address' : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
                      validator: _validateEmail,
                      onSaved: (val) => email = val,
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(borderSide: BorderSide()),
                        hintText: 'Enter password',
                      ),
                      obscureText: true,
                      validator: (val) =>
                          val.length == 0 ? 'Please enter a password' : null,
                      onSaved: (val) => password = val,
                    ),
                    SizedBox(
                      height: 48,
                    ),
                    // Log-in Button
                    MaterialButton(
                      onPressed: _submit,
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
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      "or",
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    // Register Button
                    MaterialButton(
                      onPressed: _register,
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

  @override
  void onLoginError(String error) {
    _showSnackBar(error);
  }

  @override
  void onLoginSuccess(User user) {
    if(user != null){
      Navigator.of(context).pushNamed("/home");
    } else {
      _showSnackBar("Login gagal, user account tidak terdaftar");
    }
  }
}
