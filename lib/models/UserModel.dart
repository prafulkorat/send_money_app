class UserModel {
  final String username;
  final String password;
  double balance;

  UserModel({
    required this.username,
    required this.password,
    this.balance = 500.00,
  });
}
