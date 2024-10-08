import 'package:flutter/material.dart';
import 'package:product_app/data/entity/products.dart';

class DetailPage extends StatefulWidget {
  Products product;
  DetailPage({required this.product});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.product.name),),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset("images/${widget.product.image}"),
          Text("${widget.product.price} ₺", style: const TextStyle(fontSize: 20),),
        ],),
      ),
    );
  }
}
