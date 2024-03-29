import 'dart:developer';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Kitchen extends StatefulWidget {
  @override
  _KitchenState createState() => _KitchenState();
}

class _KitchenState extends State<Kitchen> {
  bool led = false;
  bool microwave = false;
  bool fridge = false;
  String smoke = '';
  @override
  void initState() {
    super.initState();
    getInitialValues();
  }

  getInitialValues() async {
    final databaseRef = FirebaseDatabase.instance.reference();
    databaseRef.child('kitchen').once().then((DataSnapshot snapshot) {
      smoke = snapshot.value['smoke'].toString();
      led = snapshot.value['led'] == 1 ? true : false;
      microwave = snapshot.value['microwave'] == 1 ? true : false;
      fridge = snapshot.value['fridge'] == 1 ? true : false;
      setState(() {});
    });
  }

  void _handleSwitch(bool value, String deviceName) {
    if (deviceName == 'led') {
      setState(() {
        led = value;
      });
    } else if (deviceName == 'microwave') {
      setState(() {
        microwave = value;
      });
    } else if (deviceName == 'fridge') {
      setState(() {
        fridge = value;
      });
    }
    int fbvalue;
    if (value == true) {
      fbvalue = 1;
    } else {
      fbvalue = 0;
    }
    final databaseRef =
        FirebaseDatabase.instance.reference(); //database reference object
    databaseRef.child("kitchen").update({deviceName: fbvalue});
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
                Text('smoke sensor : ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40.0,
                      color: Colors.white,
                    )),
                Text(
                  smoke,
                  style: TextStyle(color: Colors.deepOrange, fontSize: 35.0),
                )
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
                    'microwave',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                      color: Colors.white,
                    ),
                  ),
                  Switch(
                    value: microwave,
                    onChanged: (value) => _handleSwitch(value, 'microwave'),
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
                    'fridge',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                      color: Colors.white,
                    ),
                  ),
                  Switch(
                    value: fridge,
                    onChanged: (value) => _handleSwitch(value, 'fridge'),
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
