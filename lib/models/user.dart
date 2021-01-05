class User {
  int id;
  String name;
  String email;
  String password;

  User(this.id, this.name, this.email, this.password);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic> {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
    };
    return map;
  }
  User.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.name = map['name'];
    this.email = map['email'];
    this.password = map['password'];
  }
}