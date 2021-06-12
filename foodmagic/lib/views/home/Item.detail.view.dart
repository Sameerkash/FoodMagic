import 'dart:math';

import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodmagic/models/order/order.dart';
import 'package:foodmagic/views/ar/ar.view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/fooditem/food.item.dart';
import '../../providers/providers.dart';
import '../../utils/extensions.dart';
import '../../widgets/background.dart';
import '../../widgets/labels.dart';

class ItemDetailView extends HookWidget {
  final FoodItem item;
  ItemDetailView({
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final home = useProvider(homeProvider.notifier);

    const sizes = ["M", "L", "S"];
    const priceUp = [29, 39, 10];

    final cart = useProvider(cartProvider.notifier);

    final itemQuanity = useProvider(
      cartProvider.select((value) => value.maybeWhen(
          orElse: () => 0,
          data: (cart) => cart.cartitems
              .firstWhere((o) => o.foodItem.itemId == item.itemId,
                  orElse: () => _dummy)
              .quantity)),
    );
    var itemCount = useState(0);

    var size = useState(sizes);

    return Scaffold(
      body: CustomBackground(
        isScrollable: false,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 0.05.sh),
          Container(
              child: Text(
            item.tags![0],
            style: context.headline3!.copyWith(fontSize: 22),
          )).padSym(0, 15),
          ImageContainer(
            imageUrl: item.imageUrl!,
          ),
          Container(),
          if (item.isVeg) VegLabel(),
          if (item.isEgg) EggLabel(),
          if (!item.isVeg) NonVegLabel(),
          OpenContainer(
            closedShape: BeveledRectangleBorder(),
            transitionDuration: const Duration(milliseconds: 400),
            closedBuilder: (context, action) {
              return Container(child: Image.asset('3D'.png, height: 30));
            },
            openBuilder: (context, action) {
              return ArView(item: item);
            },
          ),
          SizedBox(height: 0.02.sh),
          InfoCard(
            size: size,
            title: item.name,
            style: item.style!,
            type: item.type!,
            description: item.description!,
          ),
          SizedBox(height: 0.05.sh),
          ActionButtons(
            size: size,
            price: item.price,
            quantity: itemQuanity,
            remove: () {
              cart.removeFromCart(item);
            },
            add: () {
              cart.addToCart(item);
            },
          ),
          SizedBox(height: 0.05.sh),
          BottomBottons()
        ],
      ),
    );
  }
}

class ImageContainer extends StatelessWidget {
  final String imageUrl;
  const ImageContainer({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.3.sh,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        progressIndicatorBuilder: (_, ___, __) => CircularProgressIndicator(),
        imageBuilder: (_, img) => Container(
          margin: EdgeInsets.all(20),
          width: 0.3.sh,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(image: img, fit: BoxFit.contain),
          ),
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String style;
  final String type;
  final String? description;
  const InfoCard({
    Key? key,
    required this.title,
    required this.style,
    required this.type,
    this.description,
    required this.size,
  }) : super(key: key);

  final ValueNotifier<List<String>> size;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: context.headline2!.copyWith(fontSize: 24),
          ),
          Text(
            "$type . $style",
            style: context.subtitle2!.copyWith(
                fontWeight: FontWeight.bold, color: context.primaryColor),
          ).padSym(10, 0),
          SizedBox(height: 0.008.sh),
          Text(
            description!,
            style: context.bodyText1,
            textAlign: TextAlign.center,
          ).padSym(0, 0.06.sw),
        ],
      ),
    );
  }
}

class ActionButtons extends StatelessWidget {
  final int price;
  final int quantity;
  final void Function() remove;
  final void Function() add;

  const ActionButtons({
    Key? key,
    required this.price,
    required this.quantity,
    required this.remove,
    required this.add,
    required this.size,
  }) : super(key: key);

  final ValueNotifier<List<String>> size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
          style: TextButton.styleFrom(
              shape: CircleBorder(),
              minimumSize: Size(50, 50),
              backgroundColor: context.primaryColor),
          onPressed: () {},
          child: Text(
            size.value[1],
            style: context.bodyText2,
          ),
        ),
        AddToCartOptions(
          quantity: quantity,
          add: add,
          remove: remove,
        ),
        TextButton(
          style: TextButton.styleFrom(
            shape: CircleBorder(),
            minimumSize: Size(50, 50),
            backgroundColor: Colors.amber,
          ),
          onPressed: null,
          child: Text(
            "₹$price",
            style: context.bodyText2!.copyWith(color: Colors.white),
          ),
        ),
      ],
    );
  }
}

class BottomBottons extends StatelessWidget {
  const BottomBottons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 2,
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Description', style: context.bodyText1),
              Divider(color: Colors.black),
              Text('Reviews', style: context.bodyText1)
            ],
          ).padAll(15),
        ),
      ),
    );
  }
}

class AddToCartOptions extends StatelessWidget {
  final void Function() remove;
  final void Function() add;
  final int quantity;
  const AddToCartOptions({
    Key? key,
    required this.remove,
    required this.add,
    required this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          TextButton(
            style: TextButton.styleFrom(
              shape: CircleBorder(),
              minimumSize: Size(50, 50),
              backgroundColor: context.primaryColor,
            ),
            onPressed: quantity == 0 ? null : remove,
            child: Text(
              '-',
              style: context.bodyText2,
            ),
          ),
          Container(
            height: 50,
            width: 50,
            alignment: Alignment.center,
            child: Card(
                elevation: 0,
                shape: CircleBorder(),
                child: Text(
                  "$quantity",
                  style: context.headline2,
                )),
          ),
          TextButton(
            style: TextButton.styleFrom(
              shape: CircleBorder(),
              minimumSize: Size(50, 50),
              backgroundColor: context.primaryColor,
            ),
            onPressed: add,
            child: Text(
              '+',
              style: context.bodyText2,
            ),
          ),
        ],
      ),
    );
  }
}

class CircleImage extends StatelessWidget {
  final String url;
  const CircleImage({
    Key? key,
    required this.url,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        image: DecorationImage(fit: BoxFit.cover, image: AssetImage(url)),
      ),
    );
  }
}

OrderItem _dummy = OrderItem(
  quantity: 0,
  subTotal: 0,
  foodItem: FoodItem(itemId: '', category: '', name: '', price: 0),
);
