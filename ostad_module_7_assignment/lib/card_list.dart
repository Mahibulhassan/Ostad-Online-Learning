import 'package:flutter/material.dart';

import 'DataClass/ProductData.dart';


class CardPage extends StatefulWidget {
  //Variable Part
  List<ProductData> _products =[];
  CardPage(this._products);

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  int coutntTotalPdoduct =0;

  initState(){
    itemCount();
  }

  //code part
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: const Center(child: Text("Cart")),
     ),
      body:Center(
        child: Text("Total Products : $coutntTotalPdoduct",style: const TextStyle(fontSize: 20,color: Colors.black),),
      ),
    );
  }

  void itemCount(){
    for(int i =0;i<widget._products.length;i++){
      coutntTotalPdoduct += widget._products[i].product_count;
    }
    setState(() {
    });
  }
}
