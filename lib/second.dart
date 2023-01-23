import 'package:flutter/material.dart';
import 'package:routing/home.dart';
import 'package:routing/thired.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: (Scaffold(
        appBar: AppBar(
          title: Text(
            "Lier",
      ),
              backgroundColor: Color.fromARGB(255, 105, 3, 3),
              
        ),
        body: Center(
          child: Column(children: [
  Image.asset('assets/4.jpg',
                width: 500, height: 500),
            Text(
              'Don\'t lie!',
            ),

            ElevatedButton(
              onPressed: (() {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: ((context) => ThiredPage())));
              }) ,
                 style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 35, 71, 176)),
              
              child: Text(
                'Ok, I am',
              ),
              
            ),
            IconButton(
                onPressed: (() {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: ((context) => HomePage())));
                }),
                icon: Icon(Icons.home))
          ]),
        ),
      )),
    );
  }
}
