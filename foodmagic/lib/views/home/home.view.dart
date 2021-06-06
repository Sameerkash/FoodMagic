import 'package:auto_route/auto_route.dart';
import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/fooditem/food.item.dart';
import '../../providers/providers.dart';
import '../../router/router.gr.dart';
import '../../utils/extensions.dart';
import '../../widgets/background.dart';
import '../../widgets/cards.dart';
import '../../widgets/containers.dart';

class HomeView extends HookWidget {
  final home = useProvider(homeProvider);
  final h = useProvider(homeProvider.notifier);

  final cartQuantity = useProvider(cartProvider.select((value) =>
      value.maybeWhen(orElse: () => 0, data: (cart) => cart.cartitems.length)));

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
                        const Tab(text: "Dessert"),
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
                        '$cartQuantity',
                        style:
                            TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xff0e273b)),
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
          child: home.map(
            loading: (_) => Center(child: CircularProgressIndicator()),
            data: (data) => MenuItems(
              getFileView: h.repo.getImage,
              popularToday: data.popularToday,
              burgerItems: data.burger,
              dessertItems: data.dessert,
              pizzaItems: data.pizza,
            ),
            error: (_) => Container(),
          ),
        ),
      ),
    );
  }
}

class MenuItems extends StatelessWidget {
  final List<FoodItem> pizzaItems;
  final List<FoodItem> burgerItems;
  final List<FoodItem> dessertItems;
  final List<FoodItem> popularToday;
  final Function getFileView;

  const MenuItems({
    Key? key,
    required this.pizzaItems,
    required this.burgerItems,
    required this.dessertItems,
    required this.popularToday,
    required this.getFileView,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 0.37.sh,
          child: TabBarView(children: [
            Item(
              menuItems: pizzaItems,
              getFileView: getFileView,
            ),
            Item(
              menuItems: burgerItems,
              getFileView: getFileView,
            ),
            Item(
              menuItems: dessertItems,
              getFileView: getFileView,
            ),
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
            itemBuilder: (context, i) {
              return HomeItemCard(
                onPressed: () {
                  context.router
                      .push(ItemDetailViewRoute(item: popularToday[i]));
                },
                imageUrl: popularToday[i].imageUrl!,
                price: popularToday[i].price,
                subTitle: popularToday[i].style!,
                title: popularToday[i].name,
              );
            },
          ),
        ),
      ],
    );
  }
}

/// Items that are showed in each TabBarView of the app
class Item extends StatelessWidget {
  final Function getFileView;
  final List<FoodItem> menuItems;
  const Item({
    Key? key,
    required this.getFileView,
    required this.menuItems,
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
          items: menuItems
              .map(
                (e) => Builder(
                  builder: (_) => MenuItemContainer(
                    onTap: () {
                      context.router.push(ItemDetailViewRoute(item: e));
                    },
                    imageUrl: e.imageUrl!,
                    price: e.price,
                    subTitle: e.style!,
                    title: e.name,
                  ),
                ),
              )
              .toList()),
    );
  }
}
