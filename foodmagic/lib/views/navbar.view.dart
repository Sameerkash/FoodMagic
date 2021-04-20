import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foodmagic/views/cart/cart.view.dart';
import 'package:foodmagic/views/home/home.view.dart';
import 'package:foodmagic/views/profile/profile.view.dart';

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
          Center(
            child: Container(
              child: Text("Hedalskmdalo"),
            ),
          ),
          ProfileView()
        ],
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: currentIndex.value,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) {
          print(currentIndex.value);
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
