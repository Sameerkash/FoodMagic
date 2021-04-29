import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodmagic/router/router.dart';
import 'package:get/get.dart';

import 'utils/theme.dart';
import 'views/app.view.dart';

void main() {
  runApp((MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(2340, 1080),
      allowFontScaling: false,
      builder: () => GetMaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Food Magic',
        theme: AppTheme.appTheme(),
        routerDelegate: BeamerRouterDelegate(
          locationBuilder: (state) {
            if (state.uri.pathSegments.contains('signup')) {
              return AuthViewLocation(state);
            }
            return AppViewLocation(state);
          },
        ),
        routeInformationParser: BeamerRouteInformationParser(),
      ),
    );
  }
}
