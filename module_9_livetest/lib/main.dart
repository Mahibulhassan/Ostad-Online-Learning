
import 'package:flutter/material.dart';
import 'data_class.dart';
import 'netCall.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Module 9 Livetest',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ResponseDataClass res =ResponseDataClass() ;

  @override
  void initState() {
    getApiData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Food Recipt"),
      ),
      body: ListView.builder(itemCount: res!.recipes!.length
        ,itemBuilder:(context,index){
        return ListTile(
          leading: Icon(Icons.production_quantity_limits),
          title: Text(res!.recipes![index].title as String),
          subtitle: Text(res!.recipes![index].description as String),
        );
      },),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          getApiData();
        },
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

void getApiData()async{
    var data = await NetworkCallData().getApiResponse();
    setState(() {
      res = data!;
    });
  }
}
