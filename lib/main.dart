import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:outdoor/adminlogin.dart';
import 'package:outdoor/approve.dart';

import 'package:outdoor/firebase_options.dart';
import 'package:outdoor/rentactivity.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
        // StreamProvider.value(
        //     value: AuthServices.fireBaseUserStream,
        //     initialData: null,
        //     child:
        const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: rentactivity(),
      // adminlogin(),
      // Approve(),
      // Wrapper(),
      // )
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