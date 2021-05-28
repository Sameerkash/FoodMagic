import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/extensions.dart';

class CartContainer extends StatelessWidget {
  final String leading;
  final String trailing;

  const CartContainer({
    Key? key,
    required this.leading,
    required this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = context.headline2!.copyWith(color: Colors.grey);
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

/// Items that are showed witin each Tab
class MenuItemContainer extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subTitle;
  final int price;
  final void Function()? onTap;

  const MenuItemContainer({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.subTitle,
    required this.price,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.5.sh,
      width: 0.8.sw,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.chevron_left, color: Colors.white, size: 30),
              SizedBox(
                width: 0.08.sw,
              ),
              InkWell(
                onTap: onTap,
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  progressIndicatorBuilder: (_, ___, __) =>
                      CircularProgressIndicator(),
                  imageBuilder: (_, img) => CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 0.17.sw,
                      backgroundImage: img),
                ),
              ),
              SizedBox(
                width: 0.08.sw,
              ),
              Icon(Icons.chevron_right, color: Colors.white, size: 30),
            ],
          ),
          Text(
            title,
            style: context.headline1,
          ),
          Text(
            subTitle,
            style: context.bodyText1!.copyWith(color: Colors.white),
          ),
          SizedBox(
            height: 0.01.sh,
          ),
          Text(
            '₹ $price',
            style: context.caption,
          ),
        ],
      ),
    );
  }
}
