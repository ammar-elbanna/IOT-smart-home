import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class bathroom extends StatefulWidget {
  @override
  _bathroomState createState() => _bathroomState();
}

class _bathroomState extends State<bathroom> {
  bool led = false;
  bool WashingMachine = false;
  bool heater = false;
  String smoke = '';
  @override
  void initState() {
    super.initState();
    getsmokeValue();
  }

  getsmokeValue() async {
    final databaseRef = FirebaseDatabase.instance.reference();
    databaseRef
        .child('bathroom')
        .child('smoke')
        .once()
        .then((DataSnapshot snapshot) {
      smoke = snapshot.value.toString();
      setState(() {});
    });
  }

  void _handleSwitch(bool value, String deviceName) {
    if (deviceName == 'led') {
      setState(() {
        led = value;
      });
    } else if (deviceName == 'WashingMachine') {
      setState(() {
        WashingMachine = value;
      });
    } else if (deviceName == 'heater') {
      setState(() {
        heater = value;
      });
    }
    final databaseRef =
        FirebaseDatabase.instance.reference(); //database reference object
    databaseRef.child("bathroom").update({deviceName: value});
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
                    'heater',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                      color: Colors.white,
                    ),
                  ),
                  Switch(
                    value: heater,
                    onChanged: (value) => _handleSwitch(value, 'heater'),
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
                    'WashingMachine',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                      color: Colors.white,
                    ),
                  ),
                  Switch(
                    value: WashingMachine,
                    onChanged: (value) =>
                        _handleSwitch(value, 'WashingMachine'),
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
