import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/extensions.dart';

/// Items that are displayed below Popular Today section
class HomeItemCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subTitle;
  final String price;
  final Function onPressed;
  const HomeItemCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.subTitle,
    required this.price,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 0.02.sh, horizontal: 0.03.sw),
        child: Column(
          children: [
            CircleAvatar(
                radius: 0.15.sw, backgroundImage: AssetImage(imageUrl)),
            Text(
              title,
              style: context.headline2,
            ),
            Text(
              subTitle,
              overflow: TextOverflow.ellipsis,
              style: context.subtitle1,
            ),
            Spacer(
              flex: 1,
            ),
            TextButton(
              onPressed: onPressed as void Function()?,
              style:
                  TextButton.styleFrom(backgroundColor: context.primaryColor),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 0.05.sw),
                child: Text("View", style: context.button),
              ),
            )
          ],
        ),
      ),
    );
  }
}
