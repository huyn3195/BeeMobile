class UserState {
  final String? id;
  final String? email;
  final String? username;
  final String? firstName;
  final String? lastName;
  final String? permission;
  final String? avatar;
  final bool? emailVerified;

  UserState({
    this.id = "",
    this.email = "",
    this.username = "",
    this.firstName = "",
    this.lastName = "",
    this.permission = "",
    this.avatar = "",
    this.emailVerified = false,
  });

  UserState copyWith(
      {String? id,
      String? email,
      String? username,
      String? firstName,
      String? lastName,
      String? permission,
      String? avatar,
      bool? emailVerified}) {
    return UserState(
        id: id ?? this.id,
        email: email ?? this.email,
        username: username ?? this.username,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        permission: permission ?? this.permission,
        avatar: avatar ?? this.avatar,
        emailVerified: emailVerified ?? this.emailVerified);
  }

  factory UserState.fromJson(Map<String, dynamic> json) => UserState(
      id: json['_id'],
      email: json['email'],
      username: json['username'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      permission: json['permission'],
      avatar: json['avatar'],
      emailVerified: json['emailVerified']);

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "username": username,
        "firstName": firstName,
        "lastName": lastName,
        "permission": permission,
        "avatar": avatar,
        "emailVerified": emailVerified
      };
}
