import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foodmagic/views/cart/cart.view.dart';

class NavbarView extends StatefulHookWidget {
  const NavbarView({Key key}) : super(key: key);

  @override
  _NavbarViewState createState() => _NavbarViewState();
}

class _NavbarViewState extends State<NavbarView>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    var currentIndex = useState(0);
    var pageController = usePageController();
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [
          Center(
            child: Container(
              child: Text("asdjak"),
            ),
          ),
          CartView(),
          Center(
            child: Container(
              child: Text("Hedalskmdalo"),
            ),
          ),
          Center(
            child: Container(
              child: Text("Heladslko"),
            ),
          ),
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
              duration: Duration(microseconds: 500),
              curve: Curves.fastOutSlowIn);
        },
        backgroundColor: Colors.black,
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(
              Icons.home,
            ),
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
            title: Text(
              'Recent',
            ),
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
