import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:beelive/domains/user/notifiers/user_state.dart';

part 'user_notifier.g.dart';

@riverpod
class UserNotifier extends _$UserNotifier {
  @override
  UserState build() {
    return UserState();
  }

  void setUserState(UserState user) {
    state = user;
  }

  void onFirstNameChanged(String? firstName) {
    state = state.copyWith(firstName: firstName);
  }

  void onLastNameChanged(String lastName) {
    state = state.copyWith(lastName: lastName);
  }
}
