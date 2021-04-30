import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/extensions.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final double paddingH;
  final double paddingV;
  final Function onPressed;

  const CustomTextButton(
      {Key key,
      this.onPressed,
      @required this.text,
      this.paddingH,
      this.paddingV})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
          backgroundColor: context.primaryColor,
          padding: EdgeInsets.symmetric(
              horizontal: paddingH ?? 0.2.sw, vertical: paddingV ?? 0.02.sh)),
      child: Text(text, style: context.button.copyWith()),
    );
  }
}
