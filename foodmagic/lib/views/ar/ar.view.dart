// @dart = 2.9

import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';

import 'package:foodmagic/models/fooditem/food.item.dart';

class ArView extends StatefulWidget {
  final FoodItem item;
  const ArView({
    Key key,
    this.item,
  }) : super(key: key);
  @override
  _ArViewState createState() => _ArViewState();
}

class _ArViewState extends State<ArView> {
  ArCoreController arCoreController;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.item.name),
        ),
        body: Stack(
          children: <Widget>[
            ArCoreView(
              onArCoreViewCreated: _onArCoreViewCreated,
              enableTapRecognizer: true,
            ),
          ],
        ),
      ),
    );
  }

  void _onArCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;
    arCoreController.onPlaneTap = _handleOnPlaneTap;
  }

  void _addItem(ArCoreHitTestResult plane) {
    final toucanoNode = ArCoreReferenceNode(
        name: widget.item.arModelUrl,
        object3DFileName: widget.item.arModelUrl,
        position: plane.pose.translation,
        rotation: plane.pose.rotation);

    arCoreController.addArCoreNodeWithAnchor(toucanoNode);
  }

  void _handleOnPlaneTap(List<ArCoreHitTestResult> hits) {
    final hit = hits.first;
    _addItem(hit);
  }

  @override
  void dispose() {
    arCoreController.dispose();
    super.dispose();
  }
}
