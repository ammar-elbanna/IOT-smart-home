import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_project/Kitchen.dart';
import 'package:firebase_project/bathroom.dart';
import 'package:firebase_project/loginpage.dart';
import 'package:firebase_project/room1.dart';
import 'package:firebase_project/room2.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 5,
        child: Scaffold(
            appBar: AppBar(
              brightness: Brightness.dark,
              iconTheme: IconThemeData(color: Colors.white),
              title: Text("Smart home"),
              centerTitle: true,
              flexibleSpace: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    //    color: Colors.grey[160],
                  ),
                  width: double.infinity),
              bottom: TabBar(
                indicatorColor: Colors.pink,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                isScrollable: true,
                tabs: [
                  Tab(icon: Icon(Icons.home_work_outlined), text: "Home"),
                  Tab(
                    icon: Icon(Icons.home),
                    text: "ROOM1",
                  ),
                  Tab(icon: Icon(Icons.home), text: "ROOM2"),
                  Tab(icon: Icon(Icons.kitchen_outlined), text: "Kitchen"),
                  Tab(icon: Icon(Icons.bathtub), text: "bathroom"),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                loginpage(),

                Room1(),
                Room2(),
                Kitchen(),
                bathroom(),

                // buildpage("ROOM2"),
                // buildpage("ROOM3"),
                // buildpage("ROOM4"),
                // buildpage("ROOM5"),
              ],
            )),
      );
  // Widget buildpage(String text) => Center(
  //       child: Text(
  //         text,
  //         style: TextStyle(fontSize: 28),
  //       ),
  //     );
}
