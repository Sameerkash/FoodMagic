import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:foodmagic/models/fooditem/food.item.dart';
import 'package:foodmagic/providers/auth.provider.dart';

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
          VegLabel(),
          InkWell(
              onTap: () {},
              child: Container(child: Image.asset('3D'.png, height: 30))),
          SizedBox(height: 0.02.sh),
          InfoCard(size: size),
          SizedBox(height: 0.05.sh),
          ActionButtons(size: size),
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
      child: Container(
        margin: EdgeInsets.all(20),
        width: 0.3.sh,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.contain),
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key? key,
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
            'Pizza Margherita',
            style: context.headline2!.copyWith(fontSize: 24),
          ),
          Text(
            "Cheese Burst . Italiano",
            style: context.subtitle2!.copyWith(
                fontWeight: FontWeight.bold, color: context.primaryColor),
          ).padSym(15, 0),
          SizedBox(height: 0.025.sh),
          Text(
            'Flattened disk of bread dough topped with some combination of olive oil, oregano, tomato, olives, mozzarella or other cheese.',
            style: context.bodyText1,
            textAlign: TextAlign.left,
          ).padSym(0, 0.12.sw),
        ],
      ),
    );
  }
}

class ActionButtons extends StatelessWidget {
  const ActionButtons({
    Key? key,
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
        AddToCartOptions(),
        TextButton(
          style: TextButton.styleFrom(
            shape: CircleBorder(),
            minimumSize: Size(50, 50),
            backgroundColor: Colors.amber,
          ),
          onPressed: null,
          child: Text(
            "599",
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
  const AddToCartOptions({
    Key? key,
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
            onPressed: () {},
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
                  '2',
                  style: context.headline2,
                )),
          ),
          TextButton(
            style: TextButton.styleFrom(
              shape: CircleBorder(),
              minimumSize: Size(50, 50),
              backgroundColor: context.primaryColor,
            ),
            onPressed: () {},
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
