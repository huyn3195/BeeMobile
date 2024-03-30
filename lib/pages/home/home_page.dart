import 'package:beelive/constants/colors.dart';
import 'package:beelive/domains/user/notifiers/user_notifier.dart';
import 'package:beelive/domains/user/controller/user_controller.dart';
import 'package:beelive/pages/home/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:beelive/widgets/widgets.dart';
import 'package:beelive/constants/icons.dart';
import 'package:beelive/pages/home/notifiers/home_screen_notifier.dart';

class Home extends ConsumerStatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  late UserController _userController;

  @override
  void initState() {
    // TODO: implement initState
    _userController = UserController(ref);
    super.initState();
    _userController.getUser();
  }

  @override
  Widget build(BuildContext context) {
    final curIndex = ref.watch(homeScreenIndexProvider);
    ref.watch(userNotifierProvider);

    return Container(
      color: Colors.white,
      child: Scaffold(
        body: appScreen(index: curIndex),
        backgroundColor: AppColors.primaryBg,
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
              border: Border(
                  top: BorderSide(color: AppColors.thirdText, width: 0.6))),
          child: BottomAppBar(
            color: Colors.white,
            elevation: 0,
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                bottomTabButton(
                    imagePath: AppIcon.message,
                    imagePathSelected: AppIcon.messageSelected,
                    currentTab: curIndex,
                    tabNum: 0,
                    onPressed: () {
                      ref.read(homeScreenIndexProvider.notifier).changeIndex(0);
                    }),
                bottomTabButton(
                    imagePath: AppIcon.home,
                    imagePathSelected: AppIcon.homeSelected,
                    currentTab: curIndex,
                    tabNum: 1,
                    onPressed: () {
                      ref.read(homeScreenIndexProvider.notifier).changeIndex(1);
                    }),
                bottomTabButton(
                    imagePath: AppIcon.community,
                    imagePathSelected: AppIcon.communitySelected,
                    currentTab: curIndex,
                    tabNum: 2,
                    onPressed: () {
                      ref.read(homeScreenIndexProvider.notifier).changeIndex(2);
                    }),
              ],
            ),
          ),
        ),
        floatingActionButton: curIndex == 2
            ? FloatingActionButton(
                splashColor: AppColors.primaryElement,
                shape: const CircleBorder(),
                onPressed: () {},
                backgroundColor: AppColors.primaryElement,
                child: appImageWithColor(
                    height: 25,
                    width: 25,
                    color: AppColors.primaryBackground,
                    imagePath: AppIcon.pencil),
              )
            : null,
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      ),
    );
  }

  // Future _displayBottomSheet(BuildContext context, WidgetRef ref) {
  //   return showModalBottomSheet(
  //       backgroundColor: Colors.transparent,
  //       context: context,
  //       isScrollControlled: true,
  //       builder: (context) => Container());
  // }
}
