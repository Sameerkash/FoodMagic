import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'background_arc.widget.dart';

class CustomBackground extends StatelessWidget {
  final Widget child;
  const CustomBackground({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: 0.01.sh,
        width: 1.sw,
        color: Color.fromARGB(255, 16, 36, 51),
      ),
      BackgroundArc2(),
      child
    ]);
  }
}
