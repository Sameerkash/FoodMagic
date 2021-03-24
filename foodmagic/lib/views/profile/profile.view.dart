import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 16, 36, 51),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 16, 36, 51),
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 80,
        title: Text("My Profile",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0.0),
          child: const SizedBox(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Icon(Icons.edit),
          )
        ],
      ),
 body: SafeArea(
        child: Column(
          
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "photo-1529665253569-6d01c0eaf7b6.jpg "
                  ),
                  fit: BoxFit.cover
                )
              ),
            child: Container(
              width: double.infinity,
              height: 200,
              child: Container(
                alignment: Alignment(0.0,2.5),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "photo-1529665253569-6d01c0eaf7b6.jpg "
                  ),
                  radius: 60.0,
                ),
              ),
            ),
            ),
            SizedBox(
              height: 60,
            ),
            Text(
              "Charles"
              ,style: TextStyle(
                fontSize: 25.0,
                color:Colors.blueGrey,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w400
            ),
            ),
    ),
 ),
    );
  }
}