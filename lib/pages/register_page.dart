import 'package:flutter/material.dart';
import 'package:flutter_login/models/user.dart';
import 'package:sqflite/sqflite.dart';

import '../data/database_helper.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  String name;
  String email;
  String password;
  String confirmationPassword;

  bool _confirmPassword() {
      if (password != confirmationPassword) {
        _showSnackBar("Password tidak sama!");
        return false;
      }
      return true;
  }

  String _validateEmail(String value) {
    Pattern pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = new RegExp(pattern);
    return (!regex.hasMatch(value) || value == null) ? 'Enter a valid email address' : null;
  }

  void _submit() {
    final form = _formKey.currentState;
    if (form.validate()) {
      setState(() {
        form.save();
        if (_confirmPassword()) {
          _insertUser();
        }
      });
    }
  }

  void _showSnackBar(String text) {
    scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(text),
    ));
  }

  Future<void> _insertUser() async {
    var user = User(name, email, password);
    var db = DatabaseHelper();
    try {
      var saveUser = await db.insert(user);
      if (saveUser != null) {
        _showSnackBar("Akun anda sudah terdaftar. Silahkan Login!");
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.of(context).pushNamed('/login');
        });
      }
    } on DatabaseException catch (e) {
      print ("Error: $e");
      _showSnackBar("Email sudah terdaftar!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading:
        title: Text('Login Back'),
      ),
      key: scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 24.0, top: 48.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Create your account.",
                    style: TextStyle(
                      fontSize: 36.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Let's explore the app.",
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
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Full Name',
                        border: OutlineInputBorder(borderSide: BorderSide()),
                        hintText: 'Enter your name',
                      ),
                      validator: (val) => val.length == 0 ? 'Please enter your name' : null,
                      onSaved: (val) => name = val,
                    ),
                    SizedBox(height: 18,),
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
                      onSaved: (val) => password = val,
                    ),
                    SizedBox(height: 18,),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Confirmation Password',
                        border: OutlineInputBorder(borderSide: BorderSide()),
                        hintText: 'Enter confirmation password',
                      ),
                      obscureText: true,
                      validator: (val) => val.length == 0 ? 'Please enter confirmation password' : null,
                      onSaved: (val) => confirmationPassword = val,
                    ),
                    SizedBox(height: 48,),
                    // Register Button
                    MaterialButton(
                      onPressed: _submit,
                      child: Text(
                        'Register',
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
