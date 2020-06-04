class User {
  String username;
  String password;
  String email;

  User({this.username, this.password, this.email});

  Map<String, dynamic> toMap() {
    return {
      'username': this.username,
      'email': this.email,
      'password': this.password,
    };
  }
}
