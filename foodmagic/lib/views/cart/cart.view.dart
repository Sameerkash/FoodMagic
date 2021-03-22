import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodmagic/widgets/background_arc.widget.dart';
import 'package:foodmagic/widgets/custom_appbar.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 16, 36, 51),
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 70,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0.0),
          child: const SizedBox(),
        ),
      ),
      body: Stack(children: [
        BackgroundArc(),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Card(
            child: Column(
              children: [
                Container(
                  height: 0.08.sh,
                  color: Colors.amber,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Container(),
                  itemCount: 2,
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
