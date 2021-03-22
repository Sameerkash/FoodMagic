import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodmagic/widgets/background_arc.widget.dart';
import 'package:foodmagic/widgets/containers.dart';
import 'package:google_fonts/google_fonts.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 16, 36, 51),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 16, 36, 51),
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 80,
        title: Text("CART ITEM",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0.0),
          child: const SizedBox(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Icon(Icons.shopping_cart),
          )
        ],
      ),

      body: SingleChildScrollView(
        child: Stack(children: [
          BackgroundArc(),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              child: Column(
                children: [
                  Container(
                    height: 0.08.sh,
                    width: double.infinity,
                    color: Colors.amber,
                    alignment: Alignment.center,
                    child: Text(
                      "3 Items/ Totoal Cost 199",
                      style: GoogleFonts.openSans(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => ItemTile(),
                    itemCount: 3,
                  ),
                  CartContainer(
                    leading: "Coupon Code",
                    trailing: "D3DE5",
                  ),
                  CartContainer(
                    leading: "Total Amount",
                    trailing: "\$199",
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 16, 36, 51)),
                    onPressed: () {},
                    child: Container(
                        alignment: Alignment.center,
                        width: 0.75.sw,
                        height: 0.05.sh,
                        child: Text("ORDER NOW",
                            style: GoogleFonts.openSans(color: Colors.amber))),
                  ),
                  SizedBox(
                    height: 0.03.sh,
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class ItemTile extends StatelessWidget {
  const ItemTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style1 = GoogleFonts.openSans(
        fontSize: 17, fontWeight: FontWeight.w500, color: Colors.black);
    final style2 = GoogleFonts.openSans(
        fontSize: 20, fontWeight: FontWeight.w400, color: Colors.grey);
    final style3 = GoogleFonts.openSans(
        fontSize: 13, fontWeight: FontWeight.w400, color: Colors.grey);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.01.sh),
      child: Container(
        padding: EdgeInsets.all(5),
        child: Row(
          children: [
            CircleAvatar(
                radius: 50, backgroundImage: AssetImage('assets/p1.jpeg')),
            SizedBox(
              width: 0.03.sw,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(children: [
                  Text("Margherita", style: style1),
                  SizedBox(width: 0.02.sw),
                  Text("Original", style: style2)
                ]),
                Row(children: [
                  Text("Italiano", style: style3),
                  SizedBox(width: 0.02.sw),
                  Text("Lover", style: style3)
                ]),
                SizedBox(height: 0.002.sh),
                Text(
                  "\$27",
                  style: TextStyle(color: Colors.amber),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
