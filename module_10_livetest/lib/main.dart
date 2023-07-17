import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Module 10 Live Test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      home:MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
   MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Variable Part


  //Code Part
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Module 10 Live Test"),
      ),
      body: MediaQuery.of(context).orientation == Orientation.portrait ? potredMode(size):landScape(size) , // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget potredMode(Size size){
    return ListView.builder(itemCount: 15,
    itemBuilder: (context , index){
      return Column(
        children: [
         Container(
            width: size.width*1,
            height: size.height*0.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white70,
            ),
            child: Center(
              child: Container(
                color: Colors.black12,
                child: SizedBox(
                  height: 150,
                  width: 150,
                  child: Center(child: Text("150 * 150")),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10,)
        ],
      );
    },);
  }

  Widget landScape (Size size){
    return GridView.builder(
      itemCount: 6,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2) , itemBuilder: (context,index){
      return  Row(
        children: [
          Container(
            width: size.width*0.48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white70,
            ),
            child: Center(
              child: Container(
                color: Colors.black12,
                child: SizedBox(
                  height: 150,
                  width: 150,
                  child: Center(child: Text("150 * 150")),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10,)
        ],
      );
    });
  }
}
