import 'package:beelive/apis/http.dart';

class AuthAPI {
  static Future<dynamic> login({String? email, String? password}) async {
    var response = await Http().post(
      '/honey/api/login',
      data: {'username': email, 'password': password},
    );

    return response;
  }
}
