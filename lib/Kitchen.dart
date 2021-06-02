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
  bool charger = false;
  bool fan = false;
  String pir = '';
  @override
  void initState() {
    super.initState();
    getPirValue();
  }

  getPirValue() async {
    var sensorData = await FirebaseFirestore.instance
        .collection('sensors')
        .doc('sensor1')
        .get();
    var pirValue = sensorData.data()?['pir'];
    pir = pirValue.toString();
    setState(() {});
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

    FirebaseFirestore.instance
        .collection('rooms')
        .doc('kitchen')
        .update({deviceName: value});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(children: [Text('PIR: '), Text(pir)]),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'led',
                    style: TextStyle(fontSize: 28),
                  ),
                  Switch(
                    value: led,
                    onChanged: (value) => _handleSwitch(value, 'led'),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'fan',
                    style: TextStyle(fontSize: 28),
                  ),
                  Switch(
                    value: fan,
                    onChanged: (value) => _handleSwitch(value, 'fan'),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'charger',
                    style: TextStyle(fontSize: 28),
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
