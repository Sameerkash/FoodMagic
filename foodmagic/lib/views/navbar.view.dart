import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

class NavbarView extends StatefulWidget {
  const NavbarView({Key key}) : super(key: key);

  @override
  _NavbarViewState createState() => _NavbarViewState();
}

class _NavbarViewState extends State<NavbarView>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(() => _currentIndex = index),
        backgroundColor: Colors.blueGrey[500],
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
            icon: Icon(Icons.message),
            title: Text(
              'Messages ',
            ),
            inactiveColor: Colors.grey,
            activeColor: Colors.amber,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            inactiveColor: Colors.grey,
            icon: Icon(Icons.settings),
            title: Text('Settings'),
            activeColor: Colors.amber,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
