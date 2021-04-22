import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodmagic/utils/theme.dart';
import 'package:foodmagic/views/app.view.dart';
import 'package:get/get.dart';

void main() {
  runApp((MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(2340, 1080),
      allowFontScaling: false,
      builder: () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Food Magic',
        theme: AppTheme.appTheme(),
        home: AppView(),
      ),
    );
  }
}
