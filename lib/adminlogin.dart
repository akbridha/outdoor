import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:outdoor/auth_services.dart';
import 'package:outdoor/rentactivity.dart';

class adminlogin extends StatefulWidget {
  const adminlogin({Key? key}) : super(key: key);

  @override
  State<adminlogin> createState() => _adminloginState();
}

// ignore: camel_case_types
class _adminloginState extends State<adminlogin> {
  TextEditingController controllerUN = TextEditingController();
  TextEditingController controllerPW = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the adminlogin object that was created by
        // the App.build method, and use it to sset our appbar title.
        title: const Text("login"),
      ),
      body: Container(
        //kotak wadah textfield
        margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage("assets/images/outdoor.jpg"),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(5),
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.9,
        child: SingleChildScrollView(
          child: Container(
              margin: const EdgeInsets.fromLTRB(40, 70, 40, 40),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                // image: DecorationImage(
                //     image: AssetImage("assets/images/outdoor.jpg"),
                //     fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(5),
                color: Colors.grey[100]?.withOpacity(0.8),
              ),
              width: 600,
              height: 400,
              child: Column(children: [
                Container(
                    margin: const EdgeInsets.fromLTRB(30, 30, 30, 5),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextField(
                            controller: controllerUN,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "User Name"),
                          ),
                        ])),
                Container(
                    margin: const EdgeInsets.fromLTRB(30, 30, 30, 5),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextField(
                            controller: controllerPW,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Password"),
                          ),
                        ])),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      side: const BorderSide(width: 100),
                    ),
                    onPressed: () {
                      masukPakaiGAkun();
                    },
                    child: const Text('Masuk')),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                  child: SizedBox(
                    height: 30, //height of button
                    width: 360,
                    child: ElevatedButton(
                        // UNTUK CEK ISI SF
                        style: ElevatedButton.styleFrom(
                          side: const BorderSide(width: 80),
                          primary: Colors.grey[100], // background
                          onPrimary: const Color.fromARGB(
                              255, 39, 54, 163), // foreground
                        ),
                        child: const Text('Pelanggan'),
                        onPressed: () {
                          // AuthenticationService service =
                          //     AuthenticationService(FirebaseAuth.instance);

                          // if (service.signInGoogle() != null) {
                          //   keBeranda();
                          //   print("sukses");
                          // } else {
                          //   print("Login gagal");
                          // }

                          // if (service.signIn(email: controllerUN.text,password: controllerPW.text) ==
                          //     true) {
                          //   print("Login berhasil");
                          //   print(controllerPW.toString() +
                          //       "dan username" +
                          //       controllerUN.toString());
                          // }
                        }),
                  ),
                ),
              ])),
        ),
      ),
    );
  }

  void keBeranda() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return rentactivity();
    }));
  }

  Future<void> masukPakaiGAkun() async {
    AuthenticationService service =
        await AuthenticationService(FirebaseAuth.instance);
    if (service.signInGoogle() != null) {
      keBeranda();
      print("sukses");
    } else {
      print("Login gagal");
    }
  }
}
