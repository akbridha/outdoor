import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:outdoor/rentactivity.dart';
import 'package:outdoor/repository.dart';

class Confirm extends StatefulWidget {
  List<RequesByName> listrequesbyname;
  Confirm({required this.listrequesbyname});

  @override
  State<Confirm> createState() => _ConfirmState();
}

class _ConfirmState extends State<Confirm> {
  repository repo = repository();
  List<Barang> listbarang = [];
  List<RequesByName> listrquesbynameTemp = [];

  @override
  void initState() {
    //   listbarang = await repo.ambilListBarang();
    //   print(listbarang);
    getData();
    super.initState();
  }

  getData() async {
    listbarang = await repo.ambilListBarang();

    // int stok  = ;

    // while(ulang)
    // listbarang.forEach((element) {
    //   print(element.nama_barang.toString());
    //   print(element.stok.toString());
    // });

    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Item Untuk Diterima"),
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
                  image: AssetImage("assets/images/outdoor.jpg"),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(8),
            ),
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width,
            child: ListView.separated(
                itemBuilder: ((context, index) => Card(
                      child: ListTile(
                          leading: Icon(Icons.add_task_rounded),
                          title: Text(widget.listrequesbyname[index].toString()
                              // (index + 1).toString() + "." + cart[index]

                              ),
                          onTap: () {
                            cocakkanData(
                                widget.listrequesbyname[index].nama_barang,
                                widget.listrequesbyname[index].stok);

                            // repo.postApprovalData(
                            //     widget.listrequesbyname[index].nama_barang, ( stok asli
                            //     widget.listrequesbyname[index].stok));
                          }),
                    )),
                separatorBuilder: (
                  context,
                  index,
                ) {
                  return Divider(
                    color: Colors.black,
                  );
                },
                itemCount: widget.listrequesbyname.length),
          ),
        ),
      ),
    );
  }

  void cocakkanData(String nambar, String kuant) {
    //mencocokkan data dan mengurangkan
    print(nambar + ' ' + kuant);
    int i = 0;
    int jumlahAwal = 0;

    int stokSelect = 0;
    bool isFindMatch = false;
    bool ulang = true;
    while (ulang) {
      print(listbarang[i].nama_barang + " =>" + listbarang[i].stok);

      if (listbarang[i].nama_barang.toString().contains(nambar)) {
        print(" nama barang ditemukan");
        jumlahAwal = int.parse(listbarang[i].stok.toString());
        ulang = false;
        stokSelect = jumlahAwal - int.parse(kuant);
        //     print(listbarang[i].stok);
        // stokSelect = (int.parse(listbarang[i].nama_barang) - int.parse(kuant));
      } else {
        print("nama barang tidak ketemu. lanjut loop");
      }
      i++;
      if (i == listbarang.length) {
        ulang = false;
      }
    }
    print('stok select : ' + stokSelect.toString());

    repo.postApprovalData(nambar, stokSelect.toString());

    widget.listrequesbyname.forEach((element) {
      if (element.nama_barang.contains(nambar)) {
      } else {
        listrquesbynameTemp.add(element);
      }
      widget.listrequesbyname = listrquesbynameTemp;
      setState(() {});
    });
  }
}
