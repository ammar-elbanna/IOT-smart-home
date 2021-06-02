import 'package:flutter/material.dart';

class Room1 extends StatefulWidget {
  @override
  _Room1State createState() => _Room1State();
}

class _Room1State extends State<Room1> {
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
