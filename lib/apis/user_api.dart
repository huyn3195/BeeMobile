import 'package:beelive/apis/http.dart';
import 'package:beelive/entities/user.dart';

class UserAPI {
  static Future<UserLoginResponseEntity> getUser() async {
    var response = await Http().post(
      '/honey/api/getUser',
      data: {},
    );

    return UserLoginResponseEntity.fromJson(response);
  }
}
