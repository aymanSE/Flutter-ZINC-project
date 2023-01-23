import 'dart:math';

import 'package:flutter/material.dart';
import 'package:routing/second.dart';

class HomePage extends StatelessWidget {
  var rnd = new Random();
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: Text('Are you depressed?'),
        backgroundColor: Color.fromARGB(255, 35, 71, 176),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/${3 - rnd.nextInt(3)}.jpg',
                width: 500, height: 500),
            ElevatedButton(
              onPressed: (() {
                Navigator.of(context).pushNamed('thired');
              }),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 35, 71, 176),
              ),
              child: Text('I am'),
            ),
            ElevatedButton(
                onPressed: (() {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: ((context) => SecondPage())));
                }),
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 230, 234, 23),
                    ),
                child: Text('I\'m NOT!',style:TextStyle(color: Colors.black87) ,) 
                
                )
          ],
        ),
      ),
    ));
  }
}
