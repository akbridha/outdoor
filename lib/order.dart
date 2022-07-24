import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Order extends StatefulWidget {
  final int tagihan;
  Order({required this.tagihan});

  // const Order({Key? key, required this.tagihan}) : super(key: key);

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  int? tagihan;
  String? identitas;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.tagihan.toString()),
        ),
        body: Column(
          children: [
            ElevatedButton(
              child: Text("Tombol"),
              onPressed: () {},
            ),
            Text(widget.tagihan.toString())
          ],
        ));
  }
}
