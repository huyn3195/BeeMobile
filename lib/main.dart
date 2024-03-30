import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:beelive/global.dart';
import 'package:beelive/routes/routes.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  await Global.init();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    FlutterNativeSplash.remove();

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(
          title: 'Beelive Demo',
          theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
          builder: Global.materialAppBuilder(),
          initialRoute: AppRoutes.welcome,
          navigatorObservers: [AppPages.observer],
          onGenerateRoute: AppPages.generateRouteSettings),
    );
  }
}
