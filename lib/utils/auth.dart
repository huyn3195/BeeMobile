import 'package:beelive/domains/user/notifiers/user_state.dart';
import 'package:beelive/constants/roles.dart';

bool checkUserEmailVerificationStatus(UserState user) {
  return user.emailVerified! || Roles.ADMIN == user.permission;
}
