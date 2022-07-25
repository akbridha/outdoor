import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Approve extends StatelessWidget {
  const Approve({Key? key}) : super(key: key);

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
                        title: Text("contoh list"
                            // (index + 1).toString() + "." + cart[index]

                            ),
                        onTap: () {
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
                        trailing: Icon(Icons.remove_circle_outline_rounded),
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
                itemCount: 20),
          ),
        ),
      ),
    );
  }
}
