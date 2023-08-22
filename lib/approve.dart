import 'package:flutter/material.dart';
import 'package:outdoor/confirm.dart';
import 'package:outdoor/confirm.dart';
import 'package:outdoor/rentactivity.dart';
import 'package:outdoor/repository.dart';

class Approve extends StatefulWidget {
  const Approve({Key? key}) : super(key: key);

  @override
  State<Approve> createState() => _ApproveState();
}

class _ApproveState extends State<Approve> {
  List<Reques> requestList = [];
  List<String> sumNoCus = ["-"];
  List<RequesByName> listrequesbyname = [];
  String tempString = "";

  repository repo = repository();

  @override
  void initState() {
    // TODO: implement initState
    ambilReques();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Owner Approval"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.logout_outlined))
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Colors.orange,
                Colors.orangeAccent,
                Colors.red

                //add more colors for gradient
              ],
              begin: Alignment.topLeft, //begin of the gradient color
              end: Alignment.bottomRight, //end of the gradient color
              stops: [0, 0.2, 0.5] //stops for individual color
              //set the stops number equal to numbers of color
              ),
        ),
        child: SingleChildScrollView(
          child: Container(
            ////////////////////////////////bawah listview
            margin: EdgeInsets.fromLTRB(9, 4, 9, 10),
            decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage("assets/images/camp.png"),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(8),
            ),
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width,
            child: ListView.separated(
                itemBuilder: ((context, index) => Card(
                      child: ListTile(
                        leading: Icon(Icons.add_task_rounded),
                        title: Text(sumNoCus[index]
                            // (index + 1).toString() + "." + cart[index]

                            ),
                        onTap: () async {
                          listrequesbyname =
                              await repo.ambilRequesByName(sumNoCus[index]);
                          print("ini di halaman approve " +
                              listrequesbyname.toString() +
                              " ini buntut");

                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Confirm(
                              listrequesbyname: listrequesbyname,
                            );
                          }));
                          // setState(() {
                          //   if (bayar == 0) {
                          //     //nothing
                          //   } else {
                          //     bayar = bayar - int.parse(cartBiaya[index]);
                          //   }
                          //   cart.removeAt(index);
                          //   cartBiaya.removeAt(index);
                          // });
                        },
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
                itemCount: sumNoCus.length),
          ),
        ),
      ),
    );
  }

  void ambilReques() async {
    requestList = await repo.ambilListReques();

    print(sumNoCus);

    requestList.forEach((element) {
      bool ditemukan = false;
      bool ulang = true;
      int i = 0;

      while (ulang) {
        // if (stokKirim == null) {
        //   cekList();

        // }
        // print("i = " + i.toString());

        print("mencek" +
            sumNoCus[i] +
            " apakah sama dengan " +
            element.no_cust.toString());

        if (sumNoCus[i].toString().contains(element.no_cust)) {
          ditemukan = true;
          ulang = false;
        } else {
          i++;
          if (i == sumNoCus.length) {
            ulang = false;
          } else {
            ulang = true;
          }
        }
        ////////////////////////////////////
      }
      if (ditemukan == true) {
        print(element.no_cust + " ditemukan");
        // int temp = int.parse(stokKirim[i]["kuantitas"].toString());
        // temp = temp + 1;
        // stokKirim[i]["kuantitas"] = temp.toString();
        // print("banyaknya " + temp.toString());

      } else if (ditemukan == false) {
        print(element.no_cust +
            " tidak ditemukan... bikin baru di list sumNoCus");
        sumNoCus.add(element.no_cust.toString());
        // print("print stok kirim${stokKirim[0]["nama"]}");
        // print("print stok kirim${stokKirim[0]["kuantitas"]}");

      }
    });
    sumNoCus.removeAt(0);
    print(sumNoCus);

    setState(() {});
  }
}
