import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodmagic/router/router.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:foodmagic/services/locator.dart';
import 'package:get/get.dart';
import 'utils/theme.dart';

void main() async {
  await load();
  setUp();
  runApp((MyApp()));
}

class MyApp extends StatelessWidget {
  final routerDelegate = BeamerRouterDelegate(
      locationBuilder: BeamerLocationBuilder(
          beamLocations: [AppViewLocation(), AuthViewLocation()]));
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(2340, 1080),
      builder: () => GetMaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Food Magic',
        theme: AppTheme.appTheme(),
        routerDelegate: routerDelegate,
        backButtonDispatcher:
            BeamerBackButtonDispatcher(delegate: routerDelegate),
        routeInformationParser: BeamerRouteInformationParser(),
      ),
    );
  }
}
