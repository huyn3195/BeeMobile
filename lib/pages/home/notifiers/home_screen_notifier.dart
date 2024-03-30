import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_screen_notifier.g.dart';

@riverpod
class HomeScreenIndex extends _$HomeScreenIndex {
  @override
  int build() {
    return 0;
  }

  void changeIndex(int val) {
    state = val;
  }
}
