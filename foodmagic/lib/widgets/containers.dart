import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartContainer extends StatelessWidget {
  final String leading;
  final String trailing;

  const CartContainer({
    Key key,
    @required this.leading,
    @required this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = GoogleFonts.openSans(
        fontSize: 18, fontWeight: FontWeight.w400, color: Colors.grey);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0.05.sw),
      height: 0.08.sh,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(leading, style: style),
          Text(trailing, style: style),
        ],
      ),
    );
  }
}
