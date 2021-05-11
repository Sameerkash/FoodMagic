import 'package:flutter/material.dart';

class VegLabel extends StatelessWidget {
  const VegLabel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text('Veg'),
      backgroundColor: Colors.lightGreen,
      padding: EdgeInsets.symmetric(horizontal: 10),
    );
  }
}

class NonVegLabel extends StatelessWidget {
  const NonVegLabel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text('Non-Veg'),
      backgroundColor: Colors.red,
      padding: EdgeInsets.symmetric(horizontal: 10),
    );
  }
}

class EggLbael extends StatelessWidget {
  const EggLbael({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text('Egg'),
      backgroundColor: Colors.amber,
      padding: EdgeInsets.symmetric(horizontal: 10),
    );
  }
}
