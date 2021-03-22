import 'package:flutter/material.dart';

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const MyAppbar({this.title});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: new Container(
        color: Color.fromARGB(255, 16, 36, 51),
        height: preferredSize.height,
        child: new Center(
          child: new Text(title),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
