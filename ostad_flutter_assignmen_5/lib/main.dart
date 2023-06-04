import 'package:flutter/material.dart';
import 'package:ostad_flutter_assignmen_5/Page_Number_1.dart';

import 'Page_Number_2.dart';
import 'Page_Number_3.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //Variable Part
  final Screens = [
    PageNumber1(),
    PageNumber2(),
    PageNumber3()
  ];
  int index =0;

  //Code Part
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assignment 5',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home:  Scaffold(
        body: Screens[index],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (index) {
            setState(() {
              this.index = index;
            });
          },
          items: [
            BottomNavigationBarItem(  icon: Icon(Icons.dashboard),
                label: "Page 1"),
            BottomNavigationBarItem(  icon: Icon(Icons.dashboard),
                label: "Page 2"),
            BottomNavigationBarItem(  icon: Icon(Icons.dashboard),
                label: "Page 3"),
          ],
        ),
      ),
    );
  }
}

