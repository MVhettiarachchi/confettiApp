import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';



void main() => runApp(const FirstScreen());
class FirstScreen extends StatelessWidget {
  const FirstScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Confetti',
        home: Scaffold(
          backgroundColor: Colors.grey[900],
          body: ConfettiSample(),
          appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        ));
  }
}


class ConfettiSample extends StatefulWidget {
  @override
  _ConfettiSampleState createState() =>  _ConfettiSampleState ();
}

class _ConfettiSampleState  extends State<ConfettiSample> {

  ConfettiController _controllerBottomCenter;

  @override
  void initState() {
    
    _controllerBottomCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    super.initState();
  }

  @override
  void dispose() {
    
    _controllerBottomCenter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        
        
        Align(
          alignment: Alignment.bottomCenter,
          child: ConfettiWidget(
            confettiController:  _controllerBottomCenter,
            blastDirection: -pi / 2, // radial value bottom
            particleDrag: 0.05, // apply drag to the confetti
            emissionFrequency: 0.05, // how often it should emit
            numberOfParticles: 20, // number of particles to emit
            gravity: 0.3, 
            maxBlastForce: 100,
            minBlastForce: 80,
            shouldLoop: false,
            colors: const [
              Colors.green,
              Colors.blue,
              Colors.pink,
              Colors.yellow,
              Colors.purple,
              Colors.red,
              Colors.orange,
            ], 
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: FlatButton(
              color: Colors.blueAccent,
              onPressed: () {
                 _controllerBottomCenter.play();
              },
              child: _display('Click Me')),
        ),
       
      ],
    );
  }
  Text _display(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.white, fontSize: 20),
    );
  }
}