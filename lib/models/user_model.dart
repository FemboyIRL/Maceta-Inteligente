class User {
  final String id;
  final String username;
  final String email;
  final String? password;

  User({
    required this.id,
    required this.username,
    required this.email,
    this.password,
  });

  factory User.fromServer(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      username: map['username'] as String,
      email: map['email'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    final data = {
      'username': username,
      'email': email,
    };
    if (password != null) {
      data['password'] = password!;
    }
    return data;
  }
}
