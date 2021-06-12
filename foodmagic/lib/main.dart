// @dart=2.9

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart' hide Router;

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'router/router.gr.dart';
import 'utils/theme.dart';

// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext? context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback =
//           (X509Certificate cert, String host, int port) => true;
//   }
// }

void main() async {


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
