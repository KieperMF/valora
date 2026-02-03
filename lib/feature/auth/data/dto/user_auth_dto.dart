class UserAuthDto {
  final String email;
  final String password;
  final String? name;

  UserAuthDto({required this.email, required this.password, this.name});
}
