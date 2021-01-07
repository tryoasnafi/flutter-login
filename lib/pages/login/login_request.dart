import 'dart:async';
import 'package:flutter_login/data/database_helper.dart';
import 'package:flutter_login/models/user.dart';

class LoginRequest {
  DatabaseHelper con = DatabaseHelper();
  Future<User> getLogin(String email, String password) async {
    var result = await con.getLogin(email, password);
    print("Login Request : $result");
    return result;
  }
}
