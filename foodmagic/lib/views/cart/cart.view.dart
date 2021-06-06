import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/all.dart';

import 'package:foodmagic/models/cartitem/cart.item.dart';
import 'package:foodmagic/providers/providers.dart';

import '../../utils/extensions.dart';
import '../../widgets/background.dart';
import '../../widgets/button.dart';
import '../../widgets/containers.dart';

class CartView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final cart = useProvider(cartProvider);

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
          IconButton(
            onPressed: () {
              context.router.pushNamed('/order-view');
            },
            icon: Icon(Icons.shopping_bag).padR(20.0),
          )
        ],
      ),
      body: CustomBackground(
        child: cart.map(
          loading: (_) => Center(
            child: CircularProgressIndicator(),
          ),
          data: (data) => CartContent(cart: data.cart),
          empty: (_) => Container(
            child: Center(child: Text("Empty")),
          ),
        ),
      ),
    );
  }
}

class CartContent extends HookWidget {
  final CartData cart;
  const CartContent({
    Key? key,
    required this.cart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final c = useProvider(cartProvider.notifier);

    return Card(
      child: Column(
        children: [
          Container(
            height: 0.08.sh,
            width: double.infinity,
            color: Colors.amber,
            alignment: Alignment.center,
            child: Text(
              "${cart.quantity} Items,  Totoal Cost ${cart.total}",
              style: context.headline2!
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => ItemTile(
                    title: cart.cartitems[index].foodItem.name,
                    style: cart.cartitems[index].foodItem.style!,
                    price: cart.cartitems[index].foodItem.price,
                    imageUrl: cart.cartitems[index].foodItem.imageUrl!,
                    type: cart.cartitems[index].foodItem.type!,
                    tag: cart.cartitems[index].foodItem.tags![0],
                    quantity: cart.cartitems[index].quantity,
                  ),
              itemCount: cart.cartitems.length),
          CartContainer(
            leading: "Discount",
            trailing: "${cart.discount}%",
          ),
          CartContainer(
            leading: "Total Amount",
            trailing: "${cart.total}",
          ),
          CustomTextButton(
            text: "ORDER NOW",
            onPressed: () {
              c.orderNow();
            },
          ),
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
  final String style;
  final int price;
  final String tag;
  final String type;
  final String imageUrl;
  final int quantity;
  const ItemTile({
    Key? key,
    required this.title,
    required this.style,
    required this.price,
    required this.tag,
    required this.type,
    required this.imageUrl,
    required this.quantity,
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
            backgroundColor: Colors.transparent,
            radius: 50,
            backgroundImage: NetworkImage(imageUrl),
          ),
          SizedBox(
            width: 0.03.sw,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(children: [
                Text(title, style: style1),
                SizedBox(width: 0.02.sw),
                AutoSizeText(
                  style,
                  style: style2,
                  overflow: TextOverflow.clip,
                  minFontSize: 16,
                ),
              ]),
              Row(children: [
                Text(type, style: style3),
                SizedBox(width: 0.02.sw),
                Text(tag, style: style3)
              ]),
              SizedBox(height: 0.002.sh),
              Text(
                "$price x $quantity",
                style: TextStyle(color: Colors.amber),
              )
            ],
          )
        ],
      ),
    ).padSym(0.01.sh, 0.0);
  }
}
