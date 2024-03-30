import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'observers.dart';
import 'routes.dart';
import 'package:beelive/pages/signin/signin_page.dart';
import 'package:beelive/pages/signup/signup_page.dart';
import 'package:beelive/pages/welcome/welcome_page.dart';
import 'package:beelive/pages/home/home_page.dart';
import 'package:beelive/global.dart';

class AppPages {
  static final RouteObserver<Route> observer = RouteObservers();
  static List<String> history = [];

  static List<PageEntity> routes() {
    return [
      PageEntity(
        path: AppRoutes.welcome,
        page: Welcome(),
      ),
      PageEntity(
        path: AppRoutes.signIn,
        page: const SignIn(),
      ),
      PageEntity(
        path: AppRoutes.signUp,
        page: const SignUp(),
      ),
      PageEntity(
        path: AppRoutes.home,
        page: const Home(),
      ),
    ];
  }

  static CupertinoPageRoute generateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      var result = routes().where((element) => element.path == settings.name);

      if (result.isNotEmpty) {
        //if we used this is first time  or not
        bool deviceFirstTime = Global.storageService.getDeviceFirstOpen();

        if (result.first.path == AppRoutes.welcome && deviceFirstTime) {
          bool isLoggedIn = Global.storageService.isLoggedIn();
          if (isLoggedIn) {
            return CupertinoPageRoute(
                builder: (_) => const Home(), settings: settings);
          } else {
            return CupertinoPageRoute(
                builder: (_) => const SignIn(), settings: settings);
          }
        } else {
          if (result.first.path == AppRoutes.signUp) {}

          return CupertinoPageRoute(
              builder: (_) => result.first.page, settings: settings);
        }
      }
    }
    return CupertinoPageRoute(builder: (_) => Welcome(), settings: settings);
  }
}

class PageEntity<T> {
  String path;
  Widget page;

  PageEntity({
    required this.path,
    required this.page,
  });
}
