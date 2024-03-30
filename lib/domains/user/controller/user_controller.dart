import 'package:beelive/apis/user_api.dart';
import 'package:beelive/domains/user/notifiers/user_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserController {
  WidgetRef ref;

  UserController(this.ref);

  Future<void> getUser() async {
    final res = await UserAPI.getUser();

    ref.read(userNotifierProvider.notifier).setUserState(res.user!);
  }
}
