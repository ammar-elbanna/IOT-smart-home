import 'package:cloud_firestore/cloud_firestore.dart';
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
        .doc('room1')
        .update({deviceName: value});
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
