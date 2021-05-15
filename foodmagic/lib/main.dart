import 'package:beamer/beamer.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodmagic/router/router.dart';
import 'package:foodmagic/router/router.gr.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'utils/theme.dart';
import 'views/app.view.dart';

void main() async {
  await load();
  runApp(
    DevicePreview(
      enabled: false,

      /// Change this to true to enable preview
      builder: (context) => ProviderScope(child: MyApp()), // Wrap your app
    ),
  );
}

final _router = Router();

class MyApp extends StatelessWidget {
  // final routerDelegate = BeamerRouterDelegate(
  //   initialPath: '/',
  //   locationBuilder: BeamerLocationBuilder(
  //     beamLocations: [
  //       AppViewLocation(),
  //       NavBarViewLocation(),
  //       AuthViewLocation()
  //     ],
  //   ),
  // );

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(2340, 1080),
      builder: () => MaterialApp.router(
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        title: 'Food Magic',
        theme: AppTheme.appTheme(),
        routerDelegate: _router.delegate(),
        routeInformationParser: _router.defaultRouteParser(),
      ),
    );
  }
}
