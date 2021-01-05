import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading:
        title: Text('Login Back'),
      ),
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
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Full Name',
                        border: OutlineInputBorder(borderSide: BorderSide()),
                      ),
                      validator: (val) => val.length == 0 ? 'Enter Name' : null,
                    ),
                    SizedBox(height: 18,),
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
                    SizedBox(height: 18,),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        labelText: 'Confirmation Password',
                        border: OutlineInputBorder(borderSide: BorderSide()),
                      ),
                      obscureText: true,
                      validator: (val) => val.length == 0 ? 'Enter Name' : null,
                    ),
                    SizedBox(height: 48,),
                    MaterialButton(
                      onPressed: () {},
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
