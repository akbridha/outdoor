import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:outdoor/repository.dart';

class Order extends StatefulWidget {
  final int tagihan;

  final List<String> stokOrder;

  const Order({required this.tagihan, required this.stokOrder});

  // const Order({Key? key, required this.tagihan}) : super(key: key);

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  TextEditingController textEditingControllerCus = TextEditingController();
  repository repo = repository();
  int? tagihan;
  String? identitas;
  List<Map<String, String>> stokKirim = [
    {"nama": "-", "kuantitas": "-"},
    // {"nama": "E", "kuantitas": "1"}
  ];
  @override
  void initState() {
    prosesDataOrder();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.stokOrder);
    return Scaffold(
        appBar: AppBar(
          title: Text("Lengkapi Informasi"),
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/outdoor.jpg"),
                  fit: BoxFit.cover),
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // for (int i = 0; i < stokKirim.length; i++)
                //  {
                // TombolText(variabel: "ID"),
                // // Text(stokKirim.length.toString())
                // },

                Container(
                    margin: const EdgeInsets.fromLTRB(40, 20, 40, 40),
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
                          margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                for (var i in stokKirim)
                                  TombolText(
                                    variabel: i["nama"].toString(),
                                    kuantitas: i["kuantitas"].toString(),
                                  ),
                                TextField(
                                  controller: textEditingControllerCus,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: "No. WA/Telegram"),
                                ),
                              ])),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            side: const BorderSide(width: 100),
                          ),
                          onPressed: () {
                            print(textEditingControllerCus.text.toString());
                            kirimDataRequest(
                                textEditingControllerCus.text.toString());
                          },
                          child: const Text('Kirim Order')),
                    ])),
              ],
            ),
          ),
        ));
  }

  void prosesDataOrder() {
    widget.stokOrder.forEach((element) {
      print("ini stok yang belum$stokKirim");
      print("----------------");
      print("mencek " + element + "  pada order");
      bool isFindMatch = false;
      bool lup = true;
      int i = 0;
      // stokKirim.add({"nama": element.toString(), "kuantitas": "1"});

      while (lup) {
        // if (stokKirim == null) {
        //   cekList();

        // }
        // print("i = " + i.toString());
        print("mencek ${stokKirim[i]["nama"]} dengan $element");

        if (stokKirim[i]["nama"].toString().contains(element)) {
          isFindMatch = true;
          lup = false;
        } else {
          i++;
          if (i == stokKirim.length) {
            lup = false;
          } else {
            lup = true;
          }
        }
        ////////////////////////////////////
      }
      if (isFindMatch == true) {
        print(element + " ditemukan");
        int temp = int.parse(stokKirim[i]["kuantitas"].toString());
        temp = temp + 1;
        stokKirim[i]["kuantitas"] = temp.toString();
        print("banyaknya " + temp.toString());

        // stokKirim.add(value)
      } else if (isFindMatch == false) {
        print(element + " tidak ditemukan... bikin baru di list output");
        stokKirim.add({"nama": element.toString(), "kuantitas": "1"});
        print("print stok kirim${stokKirim[0]["nama"]}");
        print("print stok kirim${stokKirim[0]["kuantitas"]}");
        // stokKirim.removeAt(0);
      }
    });
    stokKirim.removeAt(0);
  }

  Future<void> kirimDataRequest(String no_cust) async {
    // print(stokKirim);
    stokKirim.forEach((element) async {
      String nama_barang = element["nama"].toString();
      print("nama barang" + nama_barang);
      String kuantitas = element["kuantitas"].toString();
      print("kuantitas" + kuantitas);

      bool response = await repo.postData(no_cust, nama_barang, kuantitas);
      print(response.toString());
    });

    // for (var i in stokKirim)
    // String sementara = stokKirim[i]["nama"].toString() +
    //       stokKirim[i]["kuantitas"].toString();
    // int x = 0;
    // String nama_barang = i["nama"].toString();
    // String kuantitas = i["kuantitas"].toString();
    // String? nama_barang;

    // i.get
    // print(i["nama"].toString() +
    //     " jumlahnya :" +
    //     i["kuantitas"].toString() +
    //     no_cust);
    // print(i.runtimeType);
  }
}

class TombolText extends StatelessWidget {
  final String variabel;
  final String kuantitas;
  const TombolText({required this.variabel, required this.kuantitas});

  @override
  Widget build(BuildContext context) {
    return
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: const [
        // Text("halo");
        // Container(
        // margin: EdgeInsets.all(8),
        // child:
        ListTile(
      leading: Icon(Icons.add_task_rounded),
      title: Text(variabel),
      onTap: () {},
      trailing: Text(kuantitas),
    );
    // )
    // ],
    // );
  }
}
