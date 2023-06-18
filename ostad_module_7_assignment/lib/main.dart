import 'package:flutter/material.dart';
import 'package:ostad_module_7_assignment/card_list.dart';

import 'DataClass/ProductData.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assignment_7',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Variable Part
  List<ProductData> _products =[
    ProductData("Product 1", 10.00, 0),
    ProductData("Product 2", 15.00, 0),
    ProductData("Product 3", 20.00, 0),
    ProductData("Product 4", 20.00, 0),
    ProductData("Product 5", 25.00, 0),
    ProductData("Product 6", 10.00, 0),
    ProductData("Product 7", 50.00, 0),
    ProductData("Product 8", 40.00, 0),
    ProductData("Product 9", 35.00, 0),
    ProductData("Product 10", 70.00, 0),
    ProductData("Product 11", 19.00, 0),
    ProductData("Product 12", 90.00, 0),
    ProductData("Product 13", 18.00, 0),
    ProductData("Product 14", 25.00, 0),
    ProductData("Product 15", 36.00, 0),
    ProductData("Product 16", 25.00, 0),
  ];

  //Code Section
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Center(child: const Text("Product List")),
      ),
      body:ListView.builder(itemCount: _products.length,
      itemBuilder: (context,index){
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_products[index].product_name,style: const TextStyle(color: Colors.black),),
                  Text("\$ ${_products[index].product_pice}0",style: const TextStyle(color: Colors.black45),),
                ],
              ),
              Column(
                children: [
                  Text("Counter : ${_products[index].product_count}",style: const TextStyle(color: Colors.black),),
                  ElevatedButton(onPressed: (){
                   if(_products[index].product_count <= 4){
                     _products[index].product_count++;
                     setState(() {
                     });
                   }else{
                     openDialouge(context,_products[index].product_name);
                   }
                  }, child: const Text("Buy Now"))
                ],
              ),
            ],
          ),
        );
      },),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed:(){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> CardPage(_products)));
        },
        child: const Icon(Icons.shopping_cart),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }


  //Alart Dialouge.....
  static Future openDialouge(BuildContext context,String productName) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Congratulations!"),
        content: Text("You've bought 5 $productName !"),
        actions: [
          TextButton(onPressed: () {
            Navigator.pop(context);
          }, child: const Text("ok"))
        ],
      ));
}
