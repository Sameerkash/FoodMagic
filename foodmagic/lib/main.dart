import 'package:beamer/beamer.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'utils/theme.dart';
import 'views/app.view.dart';

void main() async {
  await load();
  runApp(
    DevicePreview(
      enabled: false,  /// Change this to true to enable preview
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  final routerDelegate = BeamerRouterDelegate(
      locationBuilder: BeamerLocationBuilder(beamLocations: [
    // AppViewLocation(),
    // NavBarViewLocation(),
    // AuthViewLocation()
  ]));
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(2340, 1080),
      builder: () => MaterialApp(
        // .router(
        builder: DevicePreview.appBuilder,
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
