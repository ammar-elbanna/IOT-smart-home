import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Room2 extends StatefulWidget {
  @override
  _Room2State createState() => _Room2State();
}

class _Room2State extends State<Room2> {
  bool led = false;
  bool Radio = false;
  bool PC = false;
  String temp = '';
  @override
  void initState() {
    super.initState();
    tempValue();
  }

  tempValue() async {
    var sensorData = await FirebaseFirestore.instance
        .collection('sensors')
        .doc('sensor2')
        .get();
    var tempValue = sensorData.data()?['temp'];
    temp = tempValue.toString();
    setState(() {});
  }

  void _handleSwitch(bool value, String deviceName) {
    if (deviceName == 'led') {
      setState(() {
        led = value;
      });
    } else if (deviceName == 'Radio') {
      setState(() {
        Radio = value;
      });
    } else if (deviceName == 'PC') {
      setState(() {
        PC = value;
      });
    }

    FirebaseFirestore.instance
        .collection('rooms')
        .doc('room2')
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
                Text('temp sensor : ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35.0,
                      color: Colors.white,
                    )),
                Text(temp,
                    style: TextStyle(color: Colors.deepOrange, fontSize: 40.0))
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
              // Row(
              //   children: [
              //     LiteRollingSwitch(
              //       //initial value

              //       value: true,
              //       textOn: 'disponible',
              //       textOff: 'ocupado',
              //       colorOn: Colors.greenAccent[700],
              //       colorOff: Colors.redAccent[700],
              //       iconOn: Icons.done,
              //       iconOff: Icons.remove_circle_outline,
              //       textSize: 16.0,
              //       onChanged: (value) => _handleSwitch(value, 'led'),
              //     ),
              //   ],
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Radio',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                      color: Colors.white,
                    ),
                  ),
                  Switch(
                    value: Radio,
                    onChanged: (value) => _handleSwitch(value, 'Radio'),
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
                    'PC',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                      color: Colors.white,
                    ),
                  ),
                  Switch(
                    value: PC,
                    onChanged: (value) => _handleSwitch(value, 'PC'),
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
