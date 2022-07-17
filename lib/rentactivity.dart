import 'package:flutter/material.dart';

class rentactivity extends StatefulWidget {
  const rentactivity({Key? key}) : super(key: key);

  @override
  State<rentactivity> createState() => _rentactivityState();
}

class _rentactivityState extends State<rentactivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Screen Kedua"),
        ),
        body: Container(
            //kotak wadah textfield
            margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage("assets/images/camp.png"),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(5),
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.9,
            child: SingleChildScrollView(
                child: Container(
              margin: EdgeInsets.fromLTRB(4, 4, 4, 4),
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                // image: DecorationImage(
                //     image: AssetImage("assets/images/outdoor.jpg"),
                //     fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(5),
                color: Colors.grey[100]?.withOpacity(0.8),
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.9,
              child: Column(children: [
                Container(
                  margin: EdgeInsets.fromLTRB(30, 30, 30, 5),
                ),
              ]),
            ))));

    //  Container(
    //   child: ElevatedButton(
    //     child: Text("Kembali"),
    //     onPressed: () {
    //       Navigator.push(context, MaterialPageRoute(builder: (context) {
    //         return const adminlogin(
    //           title: 'balik lagi',
    //         );
    //       }));
    //     },
    //   ),
    // ));
  }
}

          // onPressed: () {
          //   Navigator.push(context, MaterialPageRoute(builder: (context) {
          //     return rentactivity();
          //   }));
          // }
