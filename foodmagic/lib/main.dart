import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodmagic/controllers/bindings/bindings.dart';
import 'package:foodmagic/router/router.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:foodmagic/services/locator.dart';
import 'package:foodmagic/views/app.view.dart';
import 'package:get/get.dart';
import 'utils/theme.dart';

void main() async {
  await load();
  setUp();
  runApp((MyApp()));
}

class MyApp extends StatelessWidget {
  final routerDelegate = BeamerRouterDelegate(
      locationBuilder: BeamerLocationBuilder(beamLocations: [
    AppViewLocation(),
    // NavBarViewLocation(),
    // AuthViewLocation()
  ]));
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(2340, 1080),
      builder: () => GetMaterialApp(
        // .router(
        initialBinding: AuthBinding(),
        debugShowCheckedModeBanner: false,
        title: 'Food Magic',
        theme: AppTheme.appTheme(),
        home: AppView(),
        // routerDelegate: routerDelegate,
        // backButtonDispatcher:
        //     BeamerBackButtonDispatcher(delegate: routerDelegate),
        // routeInformationParser: BeamerRouteInformationParser(),
      ),
    );
  }
}
