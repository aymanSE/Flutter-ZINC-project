import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ThiredPage extends StatefulWidget {
  const ThiredPage({super.key});

  @override
  State<ThiredPage> createState() => _ThiredPageState();
}

class _ThiredPageState extends State<ThiredPage> {
  List posts = [];
  var joke = "";
  Future getData() async {
    Uri url = Uri.parse("https://v2.jokeapi.dev/joke/Any?type=single");
    var response = await http.get(url);
    var responseBody = jsonDecode(response.body);
    posts.add(responseBody);
    List params = response.body.toString().split(",");

    // for (int i = 0; i < params.length; i++) {
    //   debugPrint(i.toString());
    //   debugPrint('---------------------');
    //   debugPrint(params[i].toString());
    // }
    // debugPrint('++++++');

    var type = params[2].toString().split(':').last;
    // debugPrint(type);
    // debugPrint('++++++');
    // if (type.toString() == " \"twopart\"") {
    //   var setup = params[3].toString().split(':').last.replaceAll('\"', '');
    //   var delevery = params[4].toString().split(':').last.replaceAll('\"', '');
    //   joke = "$setup \n $delevery";
    //   debugPrint(joke);
    // } else {
      joke = params[3]
          .toString()
          .split(':')
          .last
          .replaceAll('\\n', '\n')
          .replaceAll('\"', '')
          .replaceAll('\\"', '\"')
          .replaceAll('\\', '');

      // debugPrint(joke);
      return joke;
    // }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // debugPrint('in biulf');
   Future<dynamic> joke = getData();
    

    return (Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Hear this joke'),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset('assets/5.gif'),
            FutureBuilder<dynamic>(
              future: joke,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data);
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            ),
            
            //     ListView.builder(

            //   IconButton(
            //       onPressed: (() {
            //         Navigator.pop(context);
            //       }),
            //       icon: Icon(Icons.back_hand))
          ],
        ),
      ),
    ));
  }
}
