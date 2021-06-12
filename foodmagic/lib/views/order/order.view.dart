import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodmagic/providers/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:timelines/timelines.dart';

import '../../utils/extensions.dart';
import '../../widgets/background.dart';

class OrderView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final o = useProvider(ordersProvider);
    final oS = useProvider(ordersProvider.notifier);

    return Scaffold(
      appBar:
          AppBar(centerTitle: true, title: Text("ORDER STATUS"), elevation: 0),
      body: RefreshIndicator(
        onRefresh: () {
          return oS.getOrder();
        },
        child: CustomBackground(
          isScrollable: true,
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
            o.map(
              loading: (_) => Center(
                child: CircularProgressIndicator(),
              ),
              data: (data) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FixedTimeline(
                    theme: TimelineThemeData(
                      color: Colors.lightGreen,
                      indicatorTheme: IndicatorThemeData(size: 30),
                    ),
                    children: [
                      if (data.order.orderStatus == "Received")
                        DotIndicator()
                      else
                        DotIndicator(color: Colors.grey),
                      SizedBox(
                        height: 0.085.sh,
                        child: DashedLineConnector(),
                      ),
                      if (data.order.orderStatus == "OTW")
                        DotIndicator()
                      else
                        DotIndicator(color: Colors.grey),
                      SizedBox(
                        height: 0.085.sh,
                        child: DashedLineConnector(),
                      ),
                      if (data.order.orderStatus == "DEL")
                        DotIndicator()
                      else
                        DotIndicator(color: Colors.grey),
                    ],
                  ),
                  SizedBox(
                    width: 0.1.sw,
                  ),
                  Column(
                    children: [
                      StatusTile(
                        title: 'Order Received',
                        subTitle: DateFormat('EEE, dd MMM yy hh:mm a').format(
                            DateFormat('yyyy-MM-ddTHH:mm:ssZ')
                                .parse(data.order.time!)),
                      ),
                      StatusTile(title: 'On The Way', subTitle: ''),
                      StatusTile(title: 'Delivered', subTitle: ''),
                    ],
                  ),
                ],
              ),
              empty: (_) => Text("No Orders Right Now"),
            )
          ],
        ),
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
