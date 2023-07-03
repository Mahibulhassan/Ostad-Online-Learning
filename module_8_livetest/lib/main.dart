import 'package:flutter/material.dart';

import 'data_file.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Module 8 Live Test',
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

  //Variable Part
  List<Contact> contacts =[
    Contact("Mahibul Hassan", "mahibulhassan842@gmail.com", "01681690327"),
    Contact("Emon", "mahibul61@gmail.com", "01981690300"),
    Contact("Mahibul ", "hassan842@gmail.com", "01681690857"),
    Contact("Hassan", "mahibul842@gmail.com", "01684581235"),
    Contact("Mahir", "mahibulhassan842@gmail.com", "01681690327"),
  ];

  //Code Part
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title:const Center(child: Text("Contact List")),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (context,index){
            return ListTile(
              title: Text(contacts[index].name),
              onTap: (){
                Scaffold.of(context).showBottomSheet<void>(
                    (BuildContext context){
                      return Container(
                        height: size.height*0.3,
                        width: size.width*1,
                        color: Colors.white70,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Contact Details",style: TextStyle(fontSize: 20,color: Colors.black),),
                              const SizedBox(height: 20,),
                              Text("Name : ${contacts[index].name}",style: const TextStyle(fontSize: 15,color: Colors.black)),
                              Text("Email : ${contacts[index].email}",style:const TextStyle(fontSize: 15,color: Colors.black)),
                              Text("Phone Number : ${contacts[index].number}",style:const TextStyle(fontSize: 15,color: Colors.black)),
                            ],
                          ),
                        ),
                      );
                    }
                );
              },
            );
          },
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
