import 'package:flutter/material.dart';
//import 'package:must_smart_home/Data.dart';

//import 'Data.dart';

// ignore: must_be_immutable
// ignore: camel_case_types
// ignore: must_be_immutable
class bathroom extends StatefulWidget {
  //var bathroomdata = myData[0]['devices'];
  @override
  _bathroomState createState() => _bathroomState();
}

// ignore: camel_case_types
class _bathroomState extends State<bathroom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white38,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'led',
                    style: TextStyle(fontSize: 28),
                  ),
                  Switch(
                    value: true,
                    onChanged: (value) => print('ggggggg'),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Heater',
                    style: TextStyle(fontSize: 28),
                  ),
                  Switch(
                    value: true,
                    onChanged: (value) => print('ggggggg'),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '5v',
                    style: TextStyle(fontSize: 28),
                  ),
                  Switch(
                    value: true,
                    onChanged: (value) => print('ggggggg'),
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
