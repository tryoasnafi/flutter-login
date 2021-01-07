import 'package:flutter_login/models/user.dart';
import 'package:flutter_login/pages/login/login_request.dart';

abstract class LoginCallBack {
  void onLoginSuccess(User user);
  void onLoginError(String error);
}

class LoginResponse {
  LoginCallBack _callBack;

  LoginRequest loginRequest = LoginRequest();

  LoginResponse(this._callBack);

  doLogin(String email, String password) {
    loginRequest
        .getLogin(email, password)
        .then((user) => _callBack.onLoginSuccess(user))
        .catchError((onError) => _callBack.onLoginError(onError.toString()));
  }
}


