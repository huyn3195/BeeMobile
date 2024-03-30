import 'package:beelive/domains/user/notifiers/user_state.dart';

class UserLoginResponseEntity {
  String? accessToken;
  bool? success;
  UserState? user;

  UserLoginResponseEntity({
    this.success,
    this.accessToken,
    this.user,
  });

  factory UserLoginResponseEntity.fromJson(Map<String, dynamic> json) {
    return UserLoginResponseEntity(
      success: json["success"],
      accessToken: json["accessToken"],
      user: UserState.fromJson(json["user"]),
    );
  }
}
