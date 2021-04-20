import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileView extends StatelessWidget {
  final style1 = GoogleFonts.openSans(
      fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black);
  final style2 = GoogleFonts.openSans(
      fontSize: 15, fontWeight: FontWeight.w400, color: Colors.grey);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 16, 36, 51),
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
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Icon(Icons.edit),
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30),
                child: Text(
                  "Favourites",
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
              ),
              AnimatedList(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                initialItemCount: 8,
                itemBuilder: (context, index, animation) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 5),
                    child: Card(
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
                            IconButton(
                              icon: Icon(Icons.favorite_border),
                              onPressed: () {},
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
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
