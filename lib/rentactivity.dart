import 'dart:convert';

import 'package:counter_button/counter_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:outdoor/adminlogin.dart';
import 'package:outdoor/order.dart';
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
  List cartBiaya = [];
  List<String> listStok = [];
  int bayar = 0;
  int totalBayar = 0;

  int hari = 1;
  int jumlah = 0;
  //  var f = NumberFormat("###.0#", "en_US");
  // print(f.format(12.345));

  callback(varTagihan) {
    setState(() {
      totalBayar = varTagihan;
    });
  }

  ambilData() async {
    listbarang = await repo.ambilListBarang();
    print(listbarang);

    // repo.ambilListBarang();
    setState(() {});
  }

  @override
  void initState() {
    ambilData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Menu"),
          actions: [
            IconButton(
                icon: Icon(Icons.replay_outlined,
                    color: Color.fromARGB(255, 1, 140, 158), size: 34.0),
                onPressed: () {
                  ambilData();
                }),
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const adminlogin();
                  }));
                },
                icon: Icon(Icons.login_outlined))
          ],
          backgroundColor: Color.fromARGB(252, 7, 245, 206),
        ),
        body: Container(
            //kotak background

            decoration: BoxDecoration(
              // image: const DecorationImage(
              //     image: AssetImage("assets/images/camp.png"),
              //     fit: BoxFit.cover),
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
                Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Row(
                        children: [
                          Container(

                              //////////kotak atas total cart
                              margin: EdgeInsets.fromLTRB(9, 4, 9, 10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color.fromARGB(255, 0, 0, 0)),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              // color: Colors.white,
                              height: 35,
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(NumberFormat.currency(
                                          locale: 'id',
                                          decimalDigits: 0,
                                          symbol: 'Rp. ')
                                      .format(totalBayar = (bayar * hari)))
                                ],
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(9, 0, 0, 0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.grey),
                          onPressed: () {
                            setState(() {
                              bayar = 0;
                              cart.clear();
                              cartBiaya.clear();
                            });
                          },
                          child: Text("Hapus")),
                    ),
                    Container(

                        //////////kotak atas total cart
                        margin: EdgeInsets.fromLTRB(9, 1, 9, 0),
                        padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                        decoration: BoxDecoration(
                            // border:
                            //     Border.all(color: Color.fromARGB(255, 0, 0, 0)),
                            // borderRadius: BorderRadius.circular(5),
                            ),
                        // color: Colors.white,
                        height: 35,
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return Order(
                                      tagihan: totalBayar,
                                      stokOrder: listStok,
                                    );
                                  }));
                                  // Order(
                                  //     // tagihan: totalBayar,
                                  //     );
                                },
                                child: const Text("Pesan")),
                          ],
                        )),
                  ],
                ),
                Container(
                  ////////////////////////////////kotak atas cart
                  margin: EdgeInsets.fromLTRB(9, 4, 9, 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  height: 190,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.separated(
                      itemBuilder: ((context, index) => Card(
                            child: ListTile(
                              leading: const Icon(Icons.add_task_rounded),
                              title: Text("${index + 1}." + cart[index]),
                              onTap: () {
                                hapusCart(index);
                                setState(() {
                                  if (bayar == 0) {
                                    //nothing
                                  } else {
                                    bayar = bayar - int.parse(cartBiaya[index]);
                                  }
                                  print(index);
                                  cart.removeAt(index);
                                  cartBiaya.removeAt(index);
                                });
                              },
                              trailing: const Icon(
                                  Icons.remove_circle_outline_rounded),
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
                                                listbarang[index].nama,
                                                style: const TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              // baris biaya
                                              Row(children: [
                                                Text("Rp."),
                                                Text(listbarang[index]
                                                    .harga
                                                    .toString()),
                                              ]),
                                              //baris stok
                                              Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                        child: Row(
                                                      children: [
                                                        Text(
                                                            listbarang[index]
                                                                .tipe,
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
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    18, 5, 18, 5),
                                                child: CounterButton(
                                                    count:
                                                        //  hari
                                                        listbarang[index]
                                                            .jumlah,
                                                    onChange: (int val) {
                                                      if (val >= 0) {
                                                        setState(() {
                                                          listbarang[index]
                                                              .jumlah = val;

                                                          print(hari);
                                                        });
                                                      } else {
                                                        // do nothing
                                                      }

                                                      print(listbarang
                                                          .toString());
                                                    },
                                                    loading: false),
                                              )
                                            ],
                                          ),
                                        ),

                                        // Flexible(
                                        //   flex: 1,
                                        //   child: Column(
                                        //     crossAxisAlignment:
                                        //         CrossAxisAlignment.start,
                                        //   ),
                                        // ),
                                        // Flexible(
                                        //   flex: 1,
                                        //   child: Container(
                                        //     margin:
                                        //         EdgeInsets.fromLTRB(0, 0, 5, 0),
                                        //     child: Row(
                                        //       mainAxisAlignment:
                                        //           MainAxisAlignment.end,
                                        //       children: [
                                        //         ElevatedButton(
                                        //           onPressed: () {
                                        //             cart.add(listbarang[
                                        //                         index] /*ini list untuk nampilin di listview aja */
                                        //                     .nama +
                                        //                 " : Rp. " +
                                        //                 listbarang[index]
                                        //                     .harga
                                        //                     .toString());
                                        //             cartBiaya.add(
                                        //                 listbarang[index]
                                        //                     .harga
                                        //                     .toString());

                                        //             /*ini list untuk nampilin jumlah harga dan */
                                        //             /*memfasilitasi penghapusan di keranjang */

                                        //             listStok.add(
                                        //                 listbarang[index].nama);
                                        //             //ini untuk keperluan penghitungan stok

                                        //             print("ini isi cart " +
                                        //                 cart.toString());
                                        //             setState(() {
                                        //               bayar = bayar +
                                        //                   int.parse(
                                        //                       listbarang[index]
                                        //                           .harga
                                        //                           .toString());
                                        //               print(bayar);
                                        //             });
                                        //           },
                                        //           child: const Text("Tambah"),
                                        //         ),
                                        //       ],
                                        //     ),
                                        //   ),
                                        // ),
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

  hapusCart(index) {}

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

// class Barang {
//   final String nama_barang;
//   final String id_barang;
//   final String biaya_sewa;
//   final String stok;

//   const Barang({
//     required this.nama_barang,
//     required this.id_barang,
//     required this.biaya_sewa,
//     required this.stok,
//   });

//   @override
//   toString() => 'Barang: $nama_barang';

//   factory Barang.fromJson(Map<String, dynamic> json) {
//     return Barang(
//       nama_barang: json['nama_barang'],
//       id_barang: json['id_barang'],
//       biaya_sewa: json['biaya_sewa'],
//       stok: json['stok'],
//     );
//   }
// }
class Barang {
  final int id;
  final String nama;
  final int harga;
  final String tipe;
  final String gambar;
  int jumlah;

  Barang({
    required this.id,
    required this.nama,
    required this.harga,
    required this.tipe,
    required this.gambar,
    this.jumlah = 0,
  });

  @override
  String toString() {
    return 'Barang(id: $id, nama: $nama, harga: $harga, tipe: $tipe, gambar: $gambar , jumlah: $jumlah)';
  }

  factory Barang.fromJson(Map<String, dynamic> json) {
    int jumlah = json['jumlah'] ?? 0;
    return Barang(
        id: json['id'],
        nama: json['nama'],
        harga: json['harga'],
        tipe: json['tipe'],
        gambar: json['gambar'],
        jumlah: jumlah);
  }
}

// class ResponseData {
//   final List<Barang> datas;

//   ResponseData({required this.datas});

//   factory ResponseData.fromJson(Map<String, dynamic> json) {
//     final List<dynamic> datasList = json['datas'];
//     final List<Barang> datas =
//         datasList.map((data) => Barang.fromJson(data)).toList();
//     return ResponseData(datas: datas);
//   }
// }

// class Reques {
//   final String no_cust;
//   final String nama_barang;
//   final String stok;

//   const Reques({
//     required this.no_cust,
//     required this.nama_barang,
//     required this.stok,
//   });

//   @override
//   toString() => ' $nama_barang';

//   factory Reques.fromJson(Map<dynamic, dynamic> json) {
//     //tadi Map<string,dynamic>
//     return Reques(
//       no_cust: json['no_cust'],
//       nama_barang: json['nama_barang'],
//       stok: json['kuantitas'],
//     );
//   }
// }

// class RequesByName {
//   final String nama_barang;
//   final String stok;

//   const RequesByName({
//     required this.nama_barang,
//     required this.stok,
//   });

//   @override
//   toString() => ' $nama_barang';

//   factory RequesByName.fromJson(Map<String, dynamic> json) {
//     return RequesByName(
//       nama_barang: json['nama_barang'],
//       stok: json['kuantitas'],
//     );
//   }
// }

// onPressed: () {
//   Navigator.push(context, MaterialPageRoute(builder: (context) {
//     return rentactivity();
//   }));
// }
