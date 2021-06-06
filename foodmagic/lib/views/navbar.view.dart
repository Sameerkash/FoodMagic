import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'order/order.view.dart';

import 'cart/cart.view.dart';
import 'home/Item.detail.view.dart';
import 'home/home.view.dart';
import 'profile/profile.view.dart';
import 'recents/recents.view.dart';

class NavbarView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    var currentIndex = useState(0);
    var pageController = usePageController();

    return Scaffold(
      body: PageView(
        onPageChanged: (index) => currentIndex.value = index,
        controller: pageController,
        children: [
          HomeView(),
          CartView(),
          // ItemDetailView(),
          RecentsView(),
          ProfileView(),
        ],
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: currentIndex.value,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) {
          currentIndex.value = index;
          pageController.animateToPage(index,
              duration: Duration(milliseconds: 500),
              curve: Curves.fastOutSlowIn);
        },
        backgroundColor: Colors.black,
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            activeColor: Colors.amber,
            textAlign: TextAlign.center,
            inactiveColor: Colors.grey,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text('Cart'),
            activeColor: Colors.amber,
            textAlign: TextAlign.center,
            inactiveColor: Colors.grey,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.history),
            title: Text('Recent'),
            inactiveColor: Colors.grey,
            activeColor: Colors.amber,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            inactiveColor: Colors.grey,
            icon: Icon(Icons.person),
            title: Text('Profile'),
            activeColor: Colors.amber,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
