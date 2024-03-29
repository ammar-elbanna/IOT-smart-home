import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Room1 extends StatefulWidget {
  @override
  _Room1State createState() => _Room1State();
}

class _Room1State extends State<Room1> {
  bool led = false;
  bool charger = false;
  bool fan = false;
  String pir = '';
  var fbvalue = 0;
  @override
  void initState() {
    super.initState();
    getInitialValues();
  }

  getInitialValues() async {
    final databaseRef = FirebaseDatabase.instance.reference();
    databaseRef.child('room1').once().then((DataSnapshot snapshot) {
      inspect(snapshot.value);
      pir = snapshot.value['pir'].toString();
      fan = snapshot.value['fan'] == 1 ? true : false;
      charger = snapshot.value['charger'] == 1 ? true : false;
      led = snapshot.value['led'] == 1 ? true : false;
      setState(() {});
    });
  }

  void _handleSwitch(bool value, String deviceName) {
    if (deviceName == 'led') {
      setState(() {
        led = value;
      });
    } else if (deviceName == 'charger') {
      setState(() {
        charger = value;
      });
    } else if (deviceName == 'fan') {
      setState(() {
        fan = value;
      });
    }

    int fbvalue;
    if (value == true) {
      fbvalue = 1;
    } else {
      fbvalue = 0;
    }
    final databaseRef = FirebaseDatabase.instance.reference();
    //database reference object

    databaseRef.child("room1").update({deviceName: fbvalue});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/w4.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        // decoration:
        //     BoxDecoration(shape: BoxShape.rectangle, color: Colors.blue[50]),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text('PIR sensor : ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40.0,
                      color: Colors.white,
                    )),
                Text(pir,
                    style: TextStyle(
                        color: Colors.deepOrangeAccent, fontSize: 40.0))
              ]),
              Padding(
                padding: const EdgeInsets.only(top: 30.0, bottom: 40.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'led',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35.0,
                      color: Colors.white,
                    ),
                  ),
                  Switch(
                    value: led,
                    onChanged: (value) => _handleSwitch(value, 'led'),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 35.0, bottom: 15.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'fan',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                      color: Colors.white,
                    ),
                  ),
                  Switch(
                    value: fan,
                    onChanged: (value) => _handleSwitch(value, 'fan'),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 35.0, bottom: 15.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'charger',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                      color: Colors.white,
                    ),
                  ),
                  Switch(
                    value: charger,
                    onChanged: (value) => _handleSwitch(value, 'charger'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
