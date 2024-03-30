import 'package:beelive/constants/constants.dart';
import 'package:beelive/domains/user/notifiers/user_state.dart';
import 'package:beelive/global.dart';
import 'package:beelive/routes/names.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:beelive/global/global_loader.dart';
import 'package:beelive/utils/auth.dart';
import 'package:beelive/widgets/widgets.dart';
import 'package:beelive/apis/auth_dart.dart';

class AuthController {
  WidgetRef ref;

  AuthController(this.ref);

  Future<void> login(
      BuildContext context, Map<String, dynamic>? formValue) async {
    ref.read(appLoaderProvider.notifier).setLoaderValue(true);
    try {
      final res = await AuthAPI.login(
          email: formValue!['email'], password: formValue['password']);

      if (!checkUserEmailVerificationStatus(UserState.fromJson(res['user']))) {
        toastInfo("You must verify your email address first !");
        return;
      }

      await Future.delayed(const Duration(milliseconds: 100));

      if (!context.mounted) return;

      Global.storageService
          .setString(AppConstants.STORAGE_USER_TOKEN_KEY, res['accessToken']);
      Navigator.of(context).pushNamedAndRemoveUntil(
          AppRoutes.home, (Route<dynamic> route) => false);
    } catch (e) {
      print(e.toString());
    }

    ref.read(appLoaderProvider.notifier).setLoaderValue(false);

    return;
  }
}
