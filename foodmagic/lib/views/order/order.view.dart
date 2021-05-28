import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelines/timelines.dart';

import '../../utils/extensions.dart';
import '../../widgets/background.dart';

class OrderView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(centerTitle: true, title: Text("ORDER STATUS"), elevation: 0),
      body: CustomBackground(
        isScrollable: false,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 0.05.sh),
          Container(
            child: Image.asset(
              'c2'.png,
              height: 0.22.sh,
              color: Colors.white,
            ),
          ),
          Container(),
          SizedBox(height: 0.15.sh),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FixedTimeline(
                theme: TimelineThemeData(
                  color: Colors.lightGreen,
                  indicatorTheme: IndicatorThemeData(size: 30),
                ),
                children: [
                  DotIndicator(),
                  SizedBox(
                    height: 0.085.sh,
                    child: DashedLineConnector(),
                  ),
                  DotIndicator(),
                  SizedBox(
                    height: 0.085.sh,
                    child: DashedLineConnector(),
                  ),
                  DotIndicator(),
                ],
              ),
              SizedBox(
                width: 0.1.sw,
              ),
              Column(
                children: [
                  StatusTile(
                      title: 'Order Received', subTitle: '12 Oct, 2:41 PM'),
                  StatusTile(title: 'On The Way', subTitle: '12 Oct, 2:41 PM'),
                  StatusTile(title: 'Delivered', subTitle: '12 Oct, 2:41 PM'),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class StatusTile extends StatelessWidget {
  final String title;
  final String subTitle;

  const StatusTile({
    Key? key,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: context.headline2),
        Text(subTitle, style: context.subtitle1),
      ],
    ).padSym(0.035.sh, 0);
  }
}
