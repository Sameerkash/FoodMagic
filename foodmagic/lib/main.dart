import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodmagic/router/router.gr.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GlobalKey<NavigatorState> navigatorKey;
    return ScreenUtilInit(
      designSize: Size(2340, 1080),
      allowFontScaling: false,
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Food Magic',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Container(),
        builder: ExtendedNavigator.builder<Router>(
            router: Router(), navigatorKey: navigatorKey),
      ),
    );
  }
}
