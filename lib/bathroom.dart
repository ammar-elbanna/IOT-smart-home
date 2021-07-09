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
    getInitialValue();
  }

  getInitialValue() async {
    final databaseRef = FirebaseDatabase.instance.reference();
    databaseRef.child('bathroom').once().then((DataSnapshot snapshot) {
      smoke = snapshot.value['smoke'].toString();
      led = snapshot.value['led'] == 1 ? true : false;
      WashingMachine = snapshot.value['WashingMachine'] == 1 ? true : false;
      heater = snapshot.value['heater'] == 1 ? true : false;
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
    int fbvalue;
    if (value == true) {
      fbvalue = 1;
    } else {
      fbvalue = 0;
    }
    final databaseRef =
        FirebaseDatabase.instance.reference(); //database reference object
    databaseRef.child("bathroom").update({deviceName: fbvalue});
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
