import 'package:flutter/material.dart';

class adminlogin extends StatefulWidget {
  const adminlogin({Key? key, required this.title}) : super(key: key);

  final String title;

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
        title: Text(widget.title),
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
                      // String username = controllerUN.text;
                      // String pwd = controllerPW.text;
                      // bool ulang = true;
                      // int iterasi = 0;

                      // // MENCEK USERNAME DI LIST SATU PERSATU====================
                      // while (ulang) {
                      //   print("Username yang dicari " + "'" + username + "'");
                      //   print("check" + iterasi.toString());

                      //   // UNTUK MEMBATASI PENGECEKAN SAMPAI LIST HABIS AGAR TIDAK ENDLESS LOOP
                      //   if (iterasi >= data.length) {
                      //     ulang = false;
                      //     print("list yang dicek udah abis");
                      //   } else {
                      //     // MENCEK SATU PERSATU USERNAME YANG DIMASUKKAN
                      //     if (data[iterasi].containsValue(username)) {
                      //       print("Username ditemukan ");
                      //       ulang = false;

                      //       // MENCEK PASSWORD
                      //       if (data[iterasi].containsValue(pwd)) {
                      //         print("Username dan Password Benar");

                      //         //MEMASUKKAN KE NAMA KE SHARED PREFERENCE

                      //         getValuesFromMapSetSF(data[iterasi]);
                      //       } else {
                      //         print("Password Syalah");
                      //       }
                      //     } else {
                      //       print("Username tidak ditemukan");
                      //     }

                      //     iterasi++;
                      //   }
                      // }
                    },
                    child: const Text('Masuk')),
                // Container(
                //   // BUTTON DEV KOSONGKAN SHARED PREFERENCE
                //   margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                //   child: SizedBox(
                //     height: 30, //height of button
                //     width: 360,
                //     child: ElevatedButton(
                //         // UNTUK CEK ISI SF
                //         style: ElevatedButton.styleFrom(
                //           side: BorderSide(width: 80),
                //           primary: Colors.grey[100], // background
                //           onPrimary: Colors.white, // foreground
                //         ),
                //         child: Text('kosongkeun SF'),
                //         onPressed: () {
                //           // kosongkan();
                //         }),
                //   ),
                // ),
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
}
