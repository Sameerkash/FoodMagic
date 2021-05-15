import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'arc.dart';

class CustomBackground extends StatelessWidget {
  final Widget? child;
  final List<Widget>? children;
  final MainAxisSize? mainAxisSize;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final bool isScrollable;
  const CustomBackground(
      {Key? key,
      this.child,
      this.children,
      this.mainAxisAlignment,
      this.crossAxisAlignment,
      this.mainAxisSize,
      this.isScrollable = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isScrollable)
      return SingleChildScrollView(
          child: Child(
              child: child,
              children: children,
              mainAxisSize: mainAxisSize,
              crossAxisAlignment: crossAxisAlignment,
              mainAxisAlignment: mainAxisAlignment));

    return Child(
        child: child,
        children: children,
        mainAxisSize: mainAxisSize,
        crossAxisAlignment: crossAxisAlignment,
        mainAxisAlignment: mainAxisAlignment);
  }
}

class Child extends StatelessWidget {
  const Child({
    Key? key,
    required this.child,
    required this.children,
    required this.mainAxisSize,
    required this.crossAxisAlignment,
    required this.mainAxisAlignment,
  }) : super(key: key);

  final Widget? child;
  final List<Widget>? children;
  final MainAxisSize? mainAxisSize;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: 0.01.sh,
        width: 1.sw,
        color: Color.fromARGB(255, 16, 36, 51),
      ),
      BackgroundArc2(),
      if (child != null) child!,
      if (children != null && children!.isNotEmpty)
        SafeArea(
          child: Column(
              mainAxisSize: mainAxisSize ?? MainAxisSize.min,
              crossAxisAlignment:
                  crossAxisAlignment ?? CrossAxisAlignment.center,
              mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
              children: children!),
        )
    ]);
  }
}
