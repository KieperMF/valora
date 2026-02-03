class NewUserEntity {
  String email;
  String password;
  String confirmPassword;
  String userName;

  NewUserEntity({
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.userName,
  });

  factory NewUserEntity.toEmpty() {
    return NewUserEntity(
      email: '',
      password: '',
      confirmPassword: "",
      userName: "",
    );
  }

  String setEmail(String value) => email = value;
  String setPassword(String value) => password = value;
  String setConfirmPassword(String value) => confirmPassword = value;
  String setUserName(String value) => userName = value;
}
