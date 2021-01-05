class User {
  int _id;
  String _name;
  String _email;
  String _password;

  User(this._id, this._name, this._email, this._password);

  int get id => _id;

  String get password => _password;

  String get email => _email;

  String get name => _name;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic> {
      'id': _id,
      'name': _name,
      'email': _email,
      'password': _password,
    };
    return map;
  }
  User.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
    this._email = map['email'];
    this._password = map['password'];
  }
}