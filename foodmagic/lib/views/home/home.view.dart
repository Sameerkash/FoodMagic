import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:auto_route/auto_route.dart';

import '../../utils/extensions.dart';
import '../../widgets/background.dart';
import '../../widgets/cards.dart';
import '../../widgets/containers.dart';

class HomeView extends StatelessWidget {
// Temporary data
//
  final List<MenuItemContainer> pizzaItems = [
    MenuItemContainer(
      imageUrl: "assets/p1.jpeg",
      price: "\$27",
      subTitle: "Jalepeno and Pepper",
      title: "Margherita",
    ),
    MenuItemContainer(
      imageUrl: "assets/p1.jpeg",
      price: "\$27",
      subTitle: "Jalepeno and Pepper",
      title: "Margherita",
    ),
  ];

  final List<MenuItemContainer> burgerItems = [
    MenuItemContainer(
      imageUrl: "assets/burger.png",
      price: "\$27",
      subTitle: "cutlet with seasoning",
      title: "McVeggie",
    ),
    MenuItemContainer(
      imageUrl: "assets/burger.png",
      price: "\$27",
      subTitle: "cutlet with seasoning",
      title: "McVeggie",
    ),
  ];

  final List<MenuItemContainer> tacoItems = [
    MenuItemContainer(
      imageUrl: "assets/taco.png",
      price: "\$27",
      subTitle: "spices, garlic",
      title: "Buritto",
    ),
    MenuItemContainer(
      imageUrl: "assets/taco.png",
      price: "\$27",
      subTitle: "spices, garlic",
      title: "Buritto",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff0e273b),
          elevation: 0,
          title: Text("FOOD MAGIC",
              style: context.headline3!.copyWith(fontStyle: FontStyle.italic)),
          actions: [
            Icon(MaterialCommunityIcons.wallet),
            SizedBox(width: 10),
            Align(
              alignment: Alignment.center,
              child: Text("\$802",
                  style:
                      context.headline3!.copyWith(fontStyle: FontStyle.italic)),
            ),
            SizedBox(width: 25)
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(0.08.sh),
            child: Flexible(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    TabBar(
                      isScrollable: true,
                      labelColor: Colors.white,
                      indicatorColor: Colors.transparent,
                      tabs: <Widget>[
                        const Tab(text: "Pizza"),
                        const Tab(text: "Burger"),
                        const Tab(text: "Tacos"),
                      ],
                    ),
                    Spacer(flex: 1),
                    IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {},
                    ),
                    Badge(
                      badgeColor: Colors.white,
                      badgeContent: Text(
                        '3',
                        style: TextStyle(fontSize: 10),
                      ),
                      child: Icon(
                        Icons.shopping_cart,
                      ),
                    ),
                    SizedBox(width: 10)
                  ],
                ),
              ),
            ),
          ),
        ),
        body: CustomBackground(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 0.37.sh,
                child: TabBarView(children: [
                  Item(menuItems: pizzaItems),
                  Item(menuItems: burgerItems),
                  Item(menuItems: tacoItems),
                ]),
              ),
              Text(
                "FOOD AND DRINKS",
                style: context.bodyText2!.copyWith(
                    fontStyle: FontStyle.italic, fontWeight: FontWeight.w700),
              ).padSym(0.0, 15.0),
              Text(
                "Popular Today",
                style: context.bodyText1!.copyWith(fontWeight: FontWeight.bold),
              ).padSym(0.0, 15.0),
              Container(
                height: 0.32.sh,
                child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return HomeItemCard(
                      onPressed: () {
                        context.router.pushNamed('/item-detail-view');
                      },
                      imageUrl: "assets/p1.jpeg",
                      price: "\$27",
                      subTitle: "Jalepeno and Pepper",
                      title: "Margherita",
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

/// Items that are showed in each TabBarView of the app
class Item extends StatelessWidget {
  final List<MenuItemContainer>? menuItems;
  const Item({
    Key? key,
    this.menuItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.37.sh,
      width: 1.sw,
      child: CarouselSlider(
          options: CarouselOptions(
            initialPage: 0,
            enableInfiniteScroll: false,
          ),
          items: menuItems!
              .map(
                (e) => Builder(
                  builder: (_) => e,
                ),
              )
              .toList()),
    );
  }
}
