import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/extensions.dart';
import '../../widgets/background.dart';
import '../../widgets/button.dart';
import '../../widgets/containers.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 80,
        title: Text(
          "CART ITEM",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0.0),
          child: const SizedBox(),
        ),
        actions: [
          Icon(Icons.shopping_cart).padR(15.0),
        ],
      ),
      body: CustomBackground(
        child: SingleChildScrollView(
          child: CartContent(),
        ),
      ),
    );
  }
}

class CartContent extends StatelessWidget {
  const CartContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Container(
            height: 0.08.sh,
            width: double.infinity,
            color: Colors.amber,
            alignment: Alignment.center,
            child: Text(
              "3 Items/ Totoal Cost 199",
              style: context.headline2!
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => ItemTile(
              title: "Marghrita",
              subTitle: '',
              price: '',
              // price: "1234",
            ),
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
          CustomTextButton(text: "ORDER NOW"),
          SizedBox(
            height: 0.03.sh,
          ),
        ],
      ),
    ).padAll(15.0);
  }
}

class ItemTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final String price;
  const ItemTile({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style1 = context.headline1;
    final style2 = context.subtitle2;
    final style3 = context.subtitle1;
    return Container(
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
    ).padSym(0.01.sh, 0.0);
  }
}
