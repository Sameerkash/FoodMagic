import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:foodmagic/widgets/custom_background.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatelessWidget {
  final style1 = GoogleFonts.openSans(
      fontSize: 17,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.italic,
      color: Colors.white);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff0e273b),
          elevation: 0,
          title: Text("FOOD MAGIC", style: style1),
          actions: [
            Icon(MaterialCommunityIcons.wallet),
            SizedBox(width: 10),
            Align(
                alignment: Alignment.center,
                child: Text("\$802", style: style1)),
            SizedBox(width: 25)
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(0.08.sh),
            child: Flexible(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    TabBar(
                      isScrollable: true,
                      labelColor: Colors.white,
                      indicatorColor: Colors.transparent,
                      tabs: <Widget>[
                        const Tab(text: "Pizza"),
                        const Tab(text: "Burger"),
                        const Tab(text: "Tacos"),
                      ],
                    ),
                    Spacer(flex: 1),
                    IconButton(
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                    Badge(
                      badgeColor: Colors.white,
                      badgeContent: Text(
                        '3',
                        style: TextStyle(fontSize: 10),
                      ),
                      child: Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 10)
                  ],
                ),
              ),
            ),
          ),
        ),
        body: CustomBackground(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 0.37.sh,
                width: 1.sw,
                child: CarouselSlider(
                  options: CarouselOptions(
                    initialPage: 0,
                  ),
                  items: [
                    HomeItem(),
                    HomeItem(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  "FOOD AND DRINKS",
                  style: GoogleFonts.openSans(
                      color: Colors.amber,
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  "Popular Today",
                  style: GoogleFonts.openSans(
                      color: Color(0xff0e273b),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 0.32.sh,
                child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 2,
                      child: Container(
                        padding: EdgeInsets.only(
                            top: 0.02.sh,
                            left: 0.03.sw,
                            right: 0.03.sw,
                            bottom: 0.02.sh),
                        child: Column(
                          children: [
                            CircleAvatar(
                                radius: 0.15.sw,
                                backgroundImage: AssetImage('assets/p1.jpeg')),
                            Text(
                              "Margherita",
                              style: GoogleFonts.openSans(
                                  color: Color(0xff0e273b), fontSize: 18),
                            ),
                            Text(
                              "Jalepeno and Pepper",
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.openSans(
                                  color: Colors.grey, fontSize: 12),
                            ),
                            Spacer(
                              flex: 1,
                            ),
                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                  backgroundColor:
                                      Color.fromARGB(255, 16, 36, 51)),
                              child: Container(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 0.05.sw),
                                child: Text(
                                  "View",
                                  style: GoogleFonts.openSans(
                                      color: Colors.amber, fontSize: 12),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HomeItem extends StatelessWidget {
  const HomeItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.5.sh,
      width: 0.8.sw,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.chevron_left, color: Colors.white, size: 30),
              SizedBox(
                width: 0.08.sw,
              ),
              CircleAvatar(
                  radius: 0.17.sw,
                  backgroundImage: AssetImage('assets/p1.jpeg')),
              SizedBox(
                width: 0.08.sw,
              ),
              Icon(Icons.chevron_right, color: Colors.white, size: 30),
            ],
          ),
          Text(
            "Margherita",
            style: GoogleFonts.openSans(color: Colors.amber, fontSize: 18),
          ),
          Text(
            "Jalepeno and Pepper",
            style: GoogleFonts.openSans(color: Colors.white, fontSize: 15),
          ),
          SizedBox(
            height: 0.01.sh,
          ),
          Text(
            "\$25",
            style: GoogleFonts.openSans(color: Colors.amber, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
