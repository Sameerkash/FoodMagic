
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class RecentsView extends StatelessWidget {
  final style1 = GoogleFonts.openSans(
      fontSize: 16, fontWeight: FontWeight.w500, color: Colors.amber);

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
    return Scaffold(
      backgroundColor: Color(0xff0e273b),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "Your Orders",
                  style: GoogleFonts.openSans(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Colors.amber),
                ),
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (_, index) => OrderItem(
                  total: "\$100",
                  orderDate: "2 Feb 2021",
                  orderItems: orderItem,
                  style1: style1,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OrderItem extends StatelessWidget {
  final String total;
  final List<OrderItems> orderItems;
  final String orderDate;

  const OrderItem(
      {Key key,
      @required this.style1,
      @required this.total,
      @required this.orderItems,
      this.orderDate})
      : super(key: key);

  final TextStyle style1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
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
                      style: GoogleFonts.openSans(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      )),
                  Text("$total",
                      style: GoogleFonts.openSans(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber,
                      )),
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
                            backgroundImage: AssetImage(orderItems[i].imageUrl)),
                      ),
                      SizedBox(width: 0.03.sw),
                      Text("${orderItems[i].quantity} x ${orderItems[i].name}",
                          style: style1.copyWith(
                              color: Colors.black87, fontSize: 15)),
                      Spacer(flex: 1),
                      Text("${orderItems[i].price}",
                          style: style1.copyWith(
                              color: Colors.black54, fontSize: 14)),
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
                    children: [
                      Text(
                        "Ordered on",
                        style: style1.copyWith(
                            color: Colors.black54, fontSize: 14),
                      ),
                      Text("$orderDate",
                          style: style1.copyWith(
                              color: Colors.black87, fontSize: 14)),
                    ],
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.replay, color: Colors.amber),
                    label: Text(
                      "Repeat Order",
                      style: style1.copyWith(color: Colors.amber, fontSize: 14),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

// TODO:Temporary Delete later

class OrderItems {
  final String imageUrl;
  final String quantity;
  final String name;
  final String price;
  OrderItems({
    @required this.imageUrl,
    @required this.quantity,
    @required this.name,
    @required this.price,
  });
}
