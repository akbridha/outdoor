import 'package:flutter/material.dart';
import 'package:outdoor/rentactivity.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const rentactivity(),
    );
  }
}



      // ElevatedButton(
      //     child: const Icon(Icons.add),
      //     onPressed: () {
      //       Navigator.push(context, MaterialPageRoute(builder: (context) {
      //         return rentactivity();
      //       }));
      //     }), // This trailing comma makes auto-formatting nicer for build methods.