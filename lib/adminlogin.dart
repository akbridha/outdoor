import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:outdoor/approve.dart';
import 'package:outdoor/auth_services.dart';
import 'package:outdoor/rentactivity.dart';

// final GoogleSignIn _googleSignIn = GoogleSignIn(
//     scopes: ['email', 'https://www.googleapis.com/auth/contacts.readonly']);

class adminlogin extends StatefulWidget {
  const adminlogin({Key? key}) : super(key: key);

  @override
  State<adminlogin> createState() => adminloginState();
}

class adminloginState extends State<adminlogin> {
  TextEditingController controllerUN = TextEditingController();
  TextEditingController controllerPW = TextEditingController();
  // GoogleSignInAccount? _currentUser;
  String userToString = "none";
  List<String> listUser = [];
  // String? penggunaKini;

  // _adminloginState(this._firebaseAuth);

  // Future<void> _handleSignIn() async {
  //   try {
  //     await _googleSignIn.signIn();
  //   } catch (error) {
  //     print(error);
  //   }
  // }

  // Future<bool> signInGoogle() async {
  //   try {
  //     await _googleSignIn.signIn();
  //     final userGoogle = _googleSignIn.currentUser;
  //     if (userGoogle != null) {
  //       final GoogleSignInAuthentication googleSignInAuthentication =
  //           await userGoogle.authentication;
  //       final AuthCredential credential = GoogleAuthProvider.credential(
  //         accessToken: googleSignInAuthentication.accessToken,
  //         idToken: googleSignInAuthentication.idToken,
  //       );
  //       await _firebaseAuth.signInWithCredential(credential);
  //     }
  //     print(userGoogle);
  //     return _googleSignIn.currentUser != null;
  //   } on FirebaseAuthException catch (e) {
  //     debugPrint(e.message ?? "Unknow Errors");
  //     return false;
  //   }
  // }

  @override
  void initState() {
    print(userToString);
    if (userToString == "none") {
      print("user none");
      // do nothing

    } else {
      keBeranda();
    }
    //   // _googleSignIn.onCurrentUserChanged.listen((event) {

    //   // penggunaKini == null ? print("null") : print("not null");
    //   // print(penggunaKini);

    //   //   setState(() {
    //   //     _currentUser = event;
    //   //   });
    //   // });
    //   // _googleSignIn.signInSilently();
    //   super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            // IconButton(
            //     onPressed: () {
            //       keluarAkun();
            //     },
            //     icon: Icon(Icons.logout_outlined))
          ],
          title: const Text("Login Admin"),
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
                height: 300,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Masuk dengan Email Google yang terdaftar pada sistem",
                        textAlign: TextAlign.center,
                      ), // Container(
                      //     margin: const EdgeInsets.fromLTRB(30, 30, 30, 5),
                      //     child: Column(
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         children: [
                      //           TextField(
                      //             controller: controllerUN,
                      //             decoration: const InputDecoration(
                      //                 border: OutlineInputBorder(),
                      //                 labelText: "UserName"),
                      //           ),
                      //         ])),
                      // Container(
                      //     margin: const EdgeInsets.fromLTRB(30, 30, 30, 5),
                      //     child: Column(
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         children: [
                      //           TextField(
                      //             controller: controllerPW,
                      //             decoration: const InputDecoration(
                      //                 border: OutlineInputBorder(),
                      //                 labelText: "Password"),
                      //           ),
                      //         ])),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            side: const BorderSide(width: 100),
                          ),
                          onPressed: () {
                            masukPakaiGAkun().whenComplete(() {
                              // keBeranda();
                            });
                          },
                          child: const Text('Masuk')),
                      // Container(
                      //   margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                      //   child: SizedBox(
                      //     height: 30, //height of button
                      //     width: 360,
                      //     child: ElevatedButton(
                      //         // UNTUK CEK ISI SF
                      //         style: ElevatedButton.styleFrom(
                      //           side: const BorderSide(width: 80),
                      //           primary: Colors.grey[100], // background
                      //           onPrimary: const Color.fromARGB(
                      //               255, 39, 54, 163), // foreground
                      //         ),
                      //         child: const Text('Pelanggan'),
                      //         onPressed: () {}),
                      //   ),
                      // ),
                    ])),
          ),
        )
        //        _currentUser == null
        //           ? Container(
        //               //kotak wadah textfield
        //               margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
        //               padding: const EdgeInsets.all(20),
        //               decoration: BoxDecoration(
        //                 image: const DecorationImage(
        //                     image: AssetImage("assets/images/outdoor.jpg"),
        //                     fit: BoxFit.cover),
        //                 borderRadius: BorderRadius.circular(5),
        //               ),
        //               width: MediaQuery.of(context).size.width,
        //               height: MediaQuery.of(context).size.height * 0.9,
        //               child: SingleChildScrollView(
        //                 child: Container(
        //                     margin: const EdgeInsets.fromLTRB(40, 70, 40, 40),
        //                     padding: const EdgeInsets.all(20),
        //                     decoration: BoxDecoration(
        //                       // image: DecorationImage(
        //                       //     image: AssetImage("assets/images/outdoor.jpg"),
        //                       //     fit: BoxFit.cover),
        //                       borderRadius: BorderRadius.circular(5),
        //                       color: Colors.grey[100]?.withOpacity(0.8),
        //                     ),
        //                     width: 600,
        //                     height: 400,
        //                     child: Column(children: [
        //                       Container(
        //                           margin: const EdgeInsets.fromLTRB(30, 30, 30, 5),
        //                           child: Column(
        //                               mainAxisAlignment: MainAxisAlignment.center,
        //                               children: [
        //                                 TextField(
        //                                   controller: controllerUN,
        //                                   decoration: const InputDecoration(
        //                                       border: OutlineInputBorder(),
        //                                       labelText: "User Name"),
        //                                 ),
        //                               ])),
        // Container(
        //     margin: const EdgeInsets.fromLTRB(30, 30, 30, 5),
        //     child: Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           TextField(
        //             controller: controllerPW,
        //             decoration: const InputDecoration(
        //                 border: OutlineInputBorder(),
        //                 labelText: "Password"),
        //           ),
        //         ])),
        //                       ElevatedButton(
        //                           style: ElevatedButton.styleFrom(
        //                             side: const BorderSide(width: 100),
        //                           ),
        //                           onPressed: () {
        //                             masukPakaiGAkun().whenComplete(() {
        //                               keBeranda();
        //                             });
        //                             // _handleSignIn();
        //                             // print("button");
        //                           },
        //                           child: const Text('Masuk')),
        //                       Container(
        //                         margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
        //                         child: SizedBox(
        //                           height: 30, //height of button
        //                           width: 360,
        //                           // child: ElevatedButton(
        //                           //     // UNTUK CEK ISI SF
        //                           //     style: ElevatedButton.styleFrom(
        //                           //       side: const BorderSide(width: 80),
        //                           //       primary: Colors.grey[100], // background
        //                           //       onPrimary: const Color.fromARGB(
        //                           //           255, 39, 54, 163), // foreground
        //                           //     ),
        //                           //     child: const Text('Pelanggan'),
        //                           //     onPressed: () {

        //                           //     }),
        //                         ),
        //                       ),
        //                     ])),
        //               ),
        //             )
        //           : Container(
        //               //kotak wadah textfield
        //               margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
        //               padding: const EdgeInsets.all(20),
        //               decoration: BoxDecoration(
        //                 image: const DecorationImage(
        //                     image: AssetImage("assets/images/outdoor.jpg"),
        //                     fit: BoxFit.cover),
        //                 borderRadius: BorderRadius.circular(5),
        //               ),
        //               width: MediaQuery.of(context).size.width,
        //               height: MediaQuery.of(context).size.height * 0.9,
        //               child: SingleChildScrollView(
        //                 child: Container(
        //                     margin: const EdgeInsets.fromLTRB(40, 70, 40, 40),
        //                     padding: const EdgeInsets.all(20),
        //                     decoration: BoxDecoration(
        //                       // image: DecorationImage(
        //                       //     image: AssetImage("assets/images/outdoor.jpg"),
        //                       //     fit: BoxFit.cover),
        //                       borderRadius: BorderRadius.circular(5),
        //                       color: Colors.grey[100]?.withOpacity(0.8),
        //                     ),
        //                     width: 600,
        //                     height: 400,
        //                     child: Column(children: [
        //                       Container(
        //                           margin: const EdgeInsets.fromLTRB(30, 30, 30, 5),
        //                           child: Column(
        //                               mainAxisAlignment: MainAxisAlignment.center,
        //                               children: [
        //                                 TextField(
        //                                   controller: controllerPW,
        //                                   decoration: const InputDecoration(
        //                                       border: OutlineInputBorder(),
        //                                       labelText: "Password"),
        //                                 ),
        //                               ])),
        //                       ElevatedButton(
        //                           style: ElevatedButton.styleFrom(
        //                             side: const BorderSide(width: 100),
        //                           ),
        //                           onPressed: () {
        //                             masukPakaiGAkun().whenComplete(() {
        //                               keBeranda();
        //                             });
        //                           },
        //                           child: const Text('Masuk')),
        //                       Container(
        //                         margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
        //                         child: SizedBox(
        //                           height: 30, //height of button
        //                           width: 360,
        //                           child: ElevatedButton(
        //                               // UNTUK CEK ISI SF
        //                               style: ElevatedButton.styleFrom(
        //                                 side: const BorderSide(width: 80),
        //                                 primary: Colors.grey[100], // background
        //                                 onPrimary: const Color.fromARGB(
        //                                     255, 39, 54, 163), // foreground
        //                               ),
        //                               child: const Text('Pelanggan'),
        //                               onPressed: () {}),
        //                         ),
        //                       ),
        //                     ])),
        //               ),
        //             )
        );
  }

  void keBeranda() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      // return const Approve();
      return const rentactivity();
    }));
  }

  Future<void> masukPakaiGAkun() async {
    AuthenticationService service =
        await AuthenticationService(FirebaseAuth.instance);
    try {
      String result = await service.signInGoogle();
      // print(userToString.runtimeType);
      listUser = result.split(",");

      print(listUser[1]);

      userToString = listUser[1].toString();
      setState(() {
        initState();
      });
      // penggunaKini = listUser[1];

      // listUser = jsonDecode(userToString);
      //   // userToString = result.replaceAll("GoogleSignInAccount:", "");
      //   // var i = json.decode(userToString);
      //   // print(i);
      //   // listUser = userToString
      //   // var i = json.decode(json.encode(userToString));
      //   // print("ini typer dari var I " + i.runtimeType.toString());
      //   // print("ini list user" + userMap.toString());
      //   // print("ini type" + userMap.runtimeType.toString());
      //   // print("ini list user dalam map" + listUser.toString());
    } catch (e) {
      print(e);
    }
  }

  Future<void> keluarAkun() async {
    AuthenticationService service =
        await AuthenticationService(FirebaseAuth.instance);
    if (service.logoutGoogle() != null) {
      print("sukses log Out");
      setState(() {});
    } else {
      print(" gagal");
    }
  }
}

// class UserGoogle {
//   final String displayName;
//   final String id;
//   final String email;
//   final String photoUrl;

//   const UserGoogle({
//     required this.displayName,
//     required this.id,
//     required this.email,
//     required this.photoUrl,
//   });

//   factory UserGoogle.fromJson(Map<String, dynamic> json) {
//     return UserGoogle(
//       displayName: json['displayName'],
//       id: json['id'],
//       email: json['email'],
//       photoUrl: json['photoUrl'],
//     );
//   }
// }
