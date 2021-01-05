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

  ConfettiController _controllerTopCenter;

  @override
  void initState() {
    
    _controllerTopCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    super.initState();
  }

  @override
  void dispose() {
    
    _controllerTopCenter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        
        
        Align(
          alignment: Alignment.topCenter,
          child: ConfettiWidget(
            confettiController:  _controllerTopCenter,
            //blastDirection: -pi / 2, // radial value bottom
            blastDirectionality: BlastDirectionality.explosive,
            particleDrag: 0.05, // apply drag to the confetti
            emissionFrequency: 0.05, // how often it should emit
            numberOfParticles: 20, // number of particles to emit
            gravity: 0.3, 
            maxBlastForce: 100,
            minBlastForce: 80,
            shouldLoop: true,
            colors: const [
              Colors.lightGreen,
              Colors.blue,
              Colors.lightBlue,
              Colors.pink,
              Colors.yellow,
              Colors.purple,
              Colors.red,
              Colors.orange,
            ], 
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: FlatButton(
              color: Colors.blueAccent,
              onPressed: () {
                 _controllerTopCenter.play();
                 showDialog(context: context,
                  builder: (BuildContext context){
                    return SimpleCustomAlert();
                  });
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

class SimpleCustomAlert extends StatefulWidget {
  @override
  _SimpleCustomAlertState createState() => _SimpleCustomAlertState();
}

class _SimpleCustomAlertState extends State<SimpleCustomAlert> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0)
      ),
      child: Stack(
        overflow: Overflow.visible,
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: 200,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
              child: Column(
                children: [
                  Text('Congratulations', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  SizedBox(height: 5,),
                  Text('Best Wishes', style: TextStyle(fontSize: 20),),
                  SizedBox(height: 20,),
                  RaisedButton(onPressed: () {
                    Navigator.of(context).pop();
                  },
                    color: Colors.redAccent,
                    child: Text('Okay', style: TextStyle(color: Colors.white),),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: -60,
            child: CircleAvatar(
              backgroundColor: Colors.redAccent,
              radius: 60,
              child: Icon(Icons.favorite,color: Colors.pink, size: 50,),
            )
          ),
        ],
      )
    );
  }
}