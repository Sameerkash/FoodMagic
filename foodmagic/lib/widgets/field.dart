import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/extensions.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final double width;
  final Icon icon;
  final bool obscureText;
  final TextEditingController controller;
  const CustomTextField(
      {Key key,
      this.icon,
      this.label,
      this.width,
      this.controller,
      this.obscureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 0.82.sw,
      child: TextField(
        controller: controller,
        style: GoogleFonts.openSans(
            fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
        obscureText: obscureText,
        cursorColor: context.primaryColor,
        decoration: InputDecoration(suffixIcon: icon, labelText: label),
      ),
    );
  }
}
