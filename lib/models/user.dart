class User {
  String name;
  String email;
  String password;

  User(this.name, this.email, this.password);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic> {
      'name': name,
      'email': email,
      'password': password,
    };
    return map;
  }
  User.fromMap(Map<String, dynamic> map) {
    this.name = map['name'];
    this.email = map['email'];
    this.password = map['password'];
  }
}