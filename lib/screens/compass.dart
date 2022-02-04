import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_compass/flutter_compass.dart';

class Compass extends StatefulWidget {
  const Compass({Key? key}) : super(key: key);

  @override
  _CompassState createState() => _CompassState();
}

class _CompassState extends State<Compass> {

  double _direction = 0;

  @override
  void initState() {
    super.initState();
    FlutterCompass.events!.listen((direction) {
      setState(() {
        _direction = direction.heading!;
        if(_direction.round() == 0){
          HapticFeedback.heavyImpact();
        }else if(_direction.round() == 270){
          HapticFeedback.heavyImpact();
        }else if(_direction.round() == 180){
          HapticFeedback.heavyImpact();
        }else if(_direction.ceil() == 90){
          HapticFeedback.heavyImpact();
        }
        print(_direction.ceil());
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Compass"),),
      body: Center(
        child: Transform.rotate(
            angle: ((_direction) * (pi / 180) * -1),
            child: Image.asset("assets/images/compass.png", scale: 2,),
        ),
      )
    );
  }

}
