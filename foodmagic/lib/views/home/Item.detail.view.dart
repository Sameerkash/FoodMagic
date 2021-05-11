import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodmagic/widgets/labels.dart';

import '../../utils/extensions.dart';
import '../../widgets/background.dart';

class ItemDetailView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    const sizes = ["M", "L", "S"];
    const priceUp = [29, 39, 10];

    var size = useState(sizes);

    return Scaffold(
      body: CustomBackground(children: [
        SizedBox(height: 0.12.sh),
        Container(
            child: Text(
          "Chef's Special",
          style: context.headline3!.copyWith(fontSize: 22),
        )).padSym(0, 15),
        SizedBox(height: 0.05.sh),
        SizedBox(
          height: 0.3.sh,
          child: Container(
            margin: EdgeInsets.all(20),
            // width: 200,
            width: 0.3.sh,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage("margherita".png), fit: BoxFit.contain),
            ),
          ),
        ),
        Container(),
        VegLabel(),
        SizedBox(height: 0.01.sh),
        Container(
          height: 0.5.sh,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Pizza Margherita',
                style: context.headline2!.copyWith(fontSize: 24),
              ),
              Text(
                "Cheese Burst . Italiano",
                style: context.subtitle2!.copyWith(
                    fontWeight: FontWeight.bold, color: context.primaryColor),
              ).padT(5),
              Text(
                '''
              Description Loren ipsum asdjl as da sdniaskdlas
              asdasldjasasd
              asldkmasd
              asldk
              ''',
                style: context.bodyText1,
              ),
              SizedBox(
                height: 0.05.sh,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      shape: CircleBorder(),
                      minimumSize: Size(50, 50),
                      backgroundColor: Colors.amber,
                    ),
                    onPressed: () {},
                    child: Text(
                      "599",
                      style: context.bodyText2!.copyWith(color: Colors.white),
                    ),
                  ),
                  AddToCartOptions(),
                  TextButton(
                    style: TextButton.styleFrom(
                      shape: CircleBorder(),
                      minimumSize: Size(50, 50),
                      backgroundColor: context.primaryColor,
                    ),
                    onPressed: () {},
                    child: Text(
                      size.value[1],
                      style: context.bodyText2,
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ]),
    );
  }
}

class AddToCartOptions extends StatelessWidget {
  const AddToCartOptions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          TextButton(
            style: TextButton.styleFrom(
              shape: CircleBorder(),
              minimumSize: Size(50, 50),
              backgroundColor: context.primaryColor,
            ),
            onPressed: () {},
            child: Text(
              '-',
              style: context.bodyText2,
            ),
          ),
          Container(
            height: 50,
            width: 50,
            alignment: Alignment.center,
            child: Card(
                elevation: 0,
                shape: CircleBorder(),
                child: Text(
                  '2',
                  style: context.headline2,
                )),
          ),
          TextButton(
            style: TextButton.styleFrom(
              shape: CircleBorder(),
              minimumSize: Size(50, 50),
              backgroundColor: context.primaryColor,
            ),
            onPressed: () {},
            child: Text(
              '+',
              style: context.bodyText2,
            ),
          ),
        ],
      ),
    );
  }
}

class CircleImage extends StatelessWidget {
  final String url;
  const CircleImage({
    Key? key,
    required this.url,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        image: DecorationImage(fit: BoxFit.cover, image: AssetImage(url)),
      ),
    );
  }
}
