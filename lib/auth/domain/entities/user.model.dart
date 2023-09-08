class User {
  final String uid;
  final String name;
  final String nit;
  final String city;
  final String phone;
  final String email;
  final String status;
  final String password;
  final String parent;
  final String accessToken;

  User(
      {required this.uid,
      required this.name,
      required this.nit,
      required this.city,
      required this.phone,
      required this.email,
      required this.status,
      required this.password,
      required this.parent,
      required this.accessToken});

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'nit': nit,
      'city': city,
      'email': email,
      'status': status,
      'password': password,
      'parent': parent,
      'accessToken': accessToken,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      nit: map['nit'] ?? '',
      phone: map['phone'] ?? '',
      city: map['city'] ?? '',
      email: map['email'] ?? '',
      status: map['status'] ?? '',
      password: map['password'] ?? '',
      parent: map['parent'] ?? '',
      accessToken: map['accessToken'] ?? '',
    );
  }
}
