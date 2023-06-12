import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home:MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Variable
  var product_list = [
    'Apple',
    "Bananas",
    "Bread",
    "Milk",
    "Eggs",
    "Mango"
  ];

  //code
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("My Shopping List")),
        actions: [
          IconButton(onPressed: (){
            final _snackbar = SnackBar(
              content: Text("Cart is empty"),
            );
            ScaffoldMessenger.of(context).showSnackBar(_snackbar);
          }, icon:Icon(Icons.shopping_cart),
          padding: EdgeInsets.all(8.0),)
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(itemCount: product_list.length,
        itemBuilder: (context, index){
          return ListTile(
            leading: Icon(Icons.shopping_basket,size: 28,),
            title: Text(product_list[index],style: TextStyle(fontSize: 20),),
          );
        },),
      ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
