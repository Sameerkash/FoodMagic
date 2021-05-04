import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/extensions.dart';

class ProfileView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final style1 = context.headline1!.copyWith(fontWeight: FontWeight.w500);
    final style2 = context.bodyText1!
        .copyWith(fontWeight: FontWeight.w400, color: Colors.grey);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 16, 36, 51),
        elevation: 0,
        centerTitle: true,
        title: Text(
          "PROFILE",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.edit).padR(15.0),
            onPressed: () {
              // auth.signOut();
            },
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 0.35.sh,
                width: 1.sw,
                color: Color.fromARGB(255, 16, 36, 51),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(radius: .18.sw),
                    SizedBox(height: 0.03.sh),
                    Text("Charles Darwin",
                        style: TextStyle(fontSize: 20, color: Colors.white))
                  ],
                ),
              ),
              Text(
                "Favourites",
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ).padSym(15.0, 30.0),
              AnimatedList(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                initialItemCount: 8,
                itemBuilder: (context, index, animation) {
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    elevation: 1,
                    child: ListTile(
                      leading: Container(
                        height: 100,
                        width: 100,
                        child: CircleAvatar(
                            radius: 5,
                            backgroundImage: AssetImage('assets/p1.jpeg')),
                      ),
                      title: Row(
                        children: [
                          Text("Margherita", style: style1),
                          SizedBox(width: 0.02.sw),
                          Text("Original", style: style2),
                          Spacer(
                            flex: 1,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: IconButton(
                              icon: Icon(
                                Icons.favorite_border,
                                color: Colors.red,
                              ),
                              onPressed: () {},
                            ),
                          )
                        ],
                      ),
                      subtitle: Row(
                        children: [
                          Text("Italiano", style: style2),
                          SizedBox(width: 0.02.sw),
                          Text("Lover", style: style2)
                        ],
                      ),
                    ).padB(5),
                  ).padSym(5.0, 5.0);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
