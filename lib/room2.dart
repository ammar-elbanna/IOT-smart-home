import 'package:flutter/material.dart';

//import 'Data.dart';

// ignore: must_be_immutable
class Room2 extends StatefulWidget {
//  var room2data = myData[0]['devices'];
  @override
  _Room2State createState() => _Room2State();
}

class _Room2State extends State<Room2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                    'fan',
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
                    'charger',
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
