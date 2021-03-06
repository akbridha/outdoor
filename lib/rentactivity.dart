import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:outdoor/adminlogin.dart';
import 'package:outdoor/repository.dart';

import 'auth_services.dart';

class rentactivity extends StatefulWidget {
  const rentactivity({Key? key}) : super(key: key);

  @override
  State<rentactivity> createState() => _rentactivityState();
}

class _rentactivityState extends State<rentactivity> {
  repository repo = repository();
  List<Barang> listbarang = [];
  List cart = [];

  ambilData() async {
    listbarang = await repo.ambilListBarang();
    print(listbarang.toString());
    setState(() {});
  }

  @override
  void initState() {
    ambilData(); // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Prepare Your Stuff"),
          actions: [
            IconButton(
                icon: Icon(Icons.replay_outlined,
                    color: Color.fromARGB(255, 1, 140, 158), size: 34.0),
                onPressed: () {
                  ambilData();
                }),
            IconButton(
                onPressed: () {
                  keluarAkun();
                },
                icon: Icon(Icons.logout_outlined))
          ],
          backgroundColor: Color.fromARGB(252, 7, 245, 206),
        ),
        body: Container(
            //kotak background

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
              //kotak grey
              margin: EdgeInsets.fromLTRB(9, 4, 9, 10),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[100]?.withOpacity(0.6),
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.8,
              child: Column(children: [
                Container(
                  ////////////////////////////////kotak atas cart
                  margin: EdgeInsets.fromLTRB(9, 4, 9, 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.separated(
                      itemBuilder: ((context, index) => Card(
                            child: ListTile(
                              leading: Icon(Icons.add_task_rounded),
                              title: Text(
                                  (index + 1).toString() + "." + cart[index]),
                              onLongPress: () {
                                setState(() {
                                  cart.removeAt(index);
                                });
                              },
                              trailing:
                                  Icon(Icons.remove_circle_outline_rounded),
                            ),
                          )),
                      separatorBuilder: (
                        context,
                        index,
                      ) {
                        return Divider(
                          color: Colors.black,
                        );
                      },
                      itemCount: cart.length),
                ),
                Expanded(
                  //box tosca
                  child: Container(
                    margin: EdgeInsets.all(15),
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(5),
                      color: Color.fromARGB(67, 6, 242, 207).withOpacity(0.2),
                    ),
                    width: MediaQuery.of(context)
                        .size
                        .width, // apabila column dia apply tinggi. bila row dia apply lebar
                    height:
                        100, // lebar tidak terpakai bila sudah dibungkus expanded

                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.separated(
                              ////////////////////////////////////////////
                              itemBuilder: ((context, index) => Card(
                                    child: Row(
                                      children: [
                                        Flexible(
                                          flex: 1,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                listbarang[index].nama_barang,
                                                style: const TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              // baris biaya
                                              Row(children: [
                                                Text("Rp."),
                                                Text(listbarang[index]
                                                    .biaya_sewa),
                                                Text("/hari")
                                              ]),
                                              //baris stok
                                              Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                        child: Row(
                                                      children: [
                                                        const Text(
                                                            "Tersedia : ",
                                                            style: TextStyle(
                                                              fontSize: 10,
                                                            )),
                                                        Text(
                                                            listbarang[index]
                                                                .stok,
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 10,
                                                            )),
                                                      ],
                                                    )),
                                                  ]),
                                            ],
                                          ),
                                        ),
                                        Flexible(
                                          flex: 1,
                                          child: Container(
                                            margin:
                                                EdgeInsets.fromLTRB(0, 0, 5, 0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                ElevatedButton(
                                                  onPressed: () {
                                                    cart.add(listbarang[index]
                                                            .nama_barang +
                                                        "-> Rp" +
                                                        listbarang[index]
                                                            .biaya_sewa);
                                                    print("ini isi cart " +
                                                        cart.toString());
                                                    setState(() {});
                                                  },
                                                  child: const Text("Tambah"),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                              separatorBuilder: (
                                context,
                                index,
                              ) {
                                return Divider(
                                  color: Colors.blue[900],
                                );
                              },
                              itemCount: listbarang.length),
                        )

                        // ListView.builder(
                        //     itemCount: listBarang.lenght,
                        //     itemBuilder: (BuildContext context, int index) {
                        //       return bulidListItem(index);
                        //     })
                      ],
                    ),
                  ),
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

  Future<void> keluarAkun() async {
    AuthenticationService service =
        await AuthenticationService(FirebaseAuth.instance);
    if (service.logoutGoogle() != null) {
      kembaliKeLoginPage();
      print("sukses log Out");
    } else {
      print(" gagal");
    }
  }

  void kembaliKeLoginPage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return adminlogin();
    }));
  }

  // Widget bulidListItem(int index) {
  //   var item = listBarang[index];
  //   return Card(
  //     child: ListTile(
  //       title:
  //           Text(item.name.toString(), style: const TextStyle(fontSize: 18.0)),
  //       trailing: Row(
  //           mainAxisSize: MainAxisSize.min,
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             CircleAvatar(
  //                 radius: 20,
  //                 backgroundColor: Colors.grey.shade400,
  //                 child: IconButton(
  //                     color: Colors.white,
  //                     onPressed: () {},
  //                     icon: const Icon(Icons.edit))),
  //             const SizedBox(width: 5),
  //             CircleAvatar(
  //                 radius: 20,
  //                 backgroundColor: Colors.red,
  //                 child: IconButton(
  //                     color: Colors.white,
  //                     onPressed: () {},
  //                     icon: const Icon(Icons.delete)))
  //           ]),
  //     ),
  //   );
  // }
}

class Barang {
  final String nama_barang;
  final String id_barang;
  final String biaya_sewa;
  final String stok;

  const Barang({
    required this.nama_barang,
    required this.id_barang,
    required this.biaya_sewa,
    required this.stok,
  });

  @override
  toString() => 'Barang: $nama_barang';

  factory Barang.fromJson(Map<String, dynamic> json) {
    return Barang(
      nama_barang: json['nama_barang'],
      id_barang: json['id_barang'],
      biaya_sewa: json['biaya_sewa'],
      stok: json['stok'],
    );
  }
}


          // onPressed: () {
          //   Navigator.push(context, MaterialPageRoute(builder: (context) {
          //     return rentactivity();
          //   }));
          // }
