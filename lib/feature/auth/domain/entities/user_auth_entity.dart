class UserAuthEntity {
  String email;
  String password;

  UserAuthEntity({required this.email, required this.password});

  factory UserAuthEntity.toEmpty() {
    return UserAuthEntity(email: '', password: '');
  }

  String setEmail(String value) => email = value;
  String setPassword(String value) => password = value;
}
