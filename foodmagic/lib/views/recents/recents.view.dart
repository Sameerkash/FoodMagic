import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodmagic/models/order/order.dart';
import 'package:foodmagic/providers/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../utils/extensions.dart';

class RecentsView extends HookWidget {
  /// Dummy data
  final List<OrderItems> orderItem = [
    OrderItems(
        imageUrl: "assets/p1.jpeg",
        quantity: "2",
        name: "Pizza Margherita",
        price: "\$30"),
    OrderItems(
        imageUrl: "assets/burger.png",
        quantity: "1",
        name: "McVeggie",
        price: "\$30"),
    OrderItems(
        imageUrl: "assets/taco.png",
        quantity: "2",
        name: "Taco Burrito",
        price: "\$40")
  ];

  @override
  Widget build(BuildContext context) {
    final recents = useProvider(recentsProvider);
    final recentsNotifier = useProvider(recentsProvider.notifier);
    final style1 = context.bodyText1;
    return Scaffold(
      backgroundColor: Color(0xff0e273b),
      body: recents.map(
        loading: (_) => Center(
          child: CircularProgressIndicator(),
        ),
        data: (o) => SafeArea(
          child: SingleChildScrollView(
            child: RefreshIndicator(
              onRefresh: () {
                return recentsNotifier.getOrder();
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Your Orders",
                    style: context.headline1!.copyWith(fontSize: 22),
                  ).padAll(15),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: o.recentOrders.length,
                    itemBuilder: (_, i) => Orders(
                      total: "${o.recentOrders[i].total}",
                      orderDate: "${o.recentOrders[i].time}",
                      orderItems: o.recentOrders[i].orderItem,
                      style1: style1,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        empty: (_) => Container(
          child: Center(child: Text("Empty")),
        ),
      ),
    );
  }
}

class Orders extends StatelessWidget {
  final String total;
  final List<OrderFoodItem> orderItems;
  final String orderDate;

  const Orders(
      {Key? key,
      required this.style1,
      required this.total,
      required this.orderItems,
      required this.orderDate})
      : super(key: key);

  final TextStyle? style1;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 2,
      child: Container(
        padding: const EdgeInsets.all(12),
        width: 0.8.sw,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total",
                    style: context.headline2!.copyWith(color: Colors.grey)),
                Text("$total",
                    style: context.subtitle2!.copyWith(color: Colors.amber)),
              ],
            ),
            Divider(),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: orderItems.length,
              itemBuilder: (_, i) => Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      child: CircleAvatar(
                          radius: 5,
                          backgroundImage:
                              NetworkImage(orderItems[i].imageUrl)),
                    ),
                    SizedBox(width: 0.03.sw),
                    Text(
                        "${orderItems[i].quantity} x ${orderItems[i].foodItem}",
                        style: style1!
                            .copyWith(color: Colors.black87, fontSize: 15)),
                    Spacer(flex: 1),
                    Text("${orderItems[i].subTotal}",
                        style: style1!
                            .copyWith(color: Colors.black54, fontSize: 14)),
                    SizedBox(width: 0.025.sw),
                  ],
                ),
              ),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ordered on",
                      style:
                          style1!.copyWith(color: Colors.black54, fontSize: 14),
                    ),
                    Text(
                        DateFormat('EEE, dd MMM yy').format(
                            DateFormat('yyyy-MM-ddTHH:mm:ssZ')
                                .parse(orderDate)),
                        style: style1!
                            .copyWith(color: Colors.black87, fontSize: 14)),
                    Text(
                        DateFormat('hh:mm a').format(
                            DateFormat('yyyy-MM-ddTHH:mm:ssZ')
                                .parse(orderDate)),
                        style: style1!
                            .copyWith(color: Colors.black87, fontSize: 12)),
                  ],
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.replay, color: Colors.amber),
                  label: Text(
                    "Repeat Order",
                    style: style1!.copyWith(color: Colors.amber, fontSize: 14),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ).padAll(8);
  }
}

// TODO:Temporary Delete later

class OrderItems {
  final String imageUrl;
  final String quantity;
  final String name;
  final String price;
  OrderItems({
    required this.imageUrl,
    required this.quantity,
    required this.name,
    required this.price,
  });
}
