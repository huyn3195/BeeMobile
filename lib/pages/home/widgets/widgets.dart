import 'package:flutter/material.dart';
import 'package:beelive/widgets/image_widget.dart';
import 'package:beelive/constants/icons.dart';

var bottomTabs = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
      icon: appImage(imagePath: AppIcon.message),
      activeIcon: appImage(imagePath: AppIcon.messageSelected),
      label: 'Chat'),
  BottomNavigationBarItem(
      icon: appImage(imagePath: AppIcon.home),
      activeIcon: appImage(imagePath: AppIcon.homeSelected),
      label: 'Home'),
  BottomNavigationBarItem(
      icon: appImage(imagePath: AppIcon.community),
      activeIcon: appImage(imagePath: AppIcon.communitySelected),
      label: 'Community'),
];



// BottomAppBar bottomAppBar () {
//   return BottomAppBar(
//             color: Colors.white,
//             elevation: 0,
//             height: 70,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 bottomTabButton(
//                     imagePath: AppIcon.message,
//                     imagePathSelected: AppIcon.messageSelected,
//                     currentTab: curIndex,
//                     tabNum: 0,
//                     onPressed: () {
//                       ref.read(homeScreenIndexProvider.notifier).changeIndex(0);
//                     }),
//                 bottomTabButton(
//                     imagePath: AppIcon.home,
//                     imagePathSelected: AppIcon.homeSelected,
//                     currentTab: curIndex,
//                     tabNum: 1,
//                     onPressed: () {
//                       ref.read(homeScreenIndexProvider.notifier).changeIndex(1);
//                     }),
//                 bottomTabButton(
//                     imagePath: AppIcon.community,
//                     imagePathSelected: AppIcon.communitySelected,
//                     currentTab: curIndex,
//                     tabNum: 2,
//                     onPressed: () {
//                       ref.read(homeScreenIndexProvider.notifier).changeIndex(2);
//                     }),
//               ],
//             ),
//           )
// }