import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'arc.dart';

class CustomBackground extends StatelessWidget {
  final Widget? child;
  final List<Widget>? children;
  final MainAxisSize? mainAxisSize;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  const CustomBackground(
      {Key? key,
      this.child,
      this.children,
      this.mainAxisAlignment,
      this.crossAxisAlignment,
      this.mainAxisSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Stack(children: [
      Container(
        height: 0.01.sh,
        width: 1.sw,
        color: Color.fromARGB(255, 16, 36, 51),
      ),
      BackgroundArc2(),
      if (child != null) child!,
      if (children != null && children!.isNotEmpty)
        Column(
            mainAxisSize: mainAxisSize ?? MainAxisSize.min,
            crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
            mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
            children: children!)
    ]));
  }
}
