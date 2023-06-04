import 'package:flutter/material.dart';
import 'package:ostad_flutter_assignmen_5/Page_Number_1.dart';
import 'package:ostad_flutter_assignmen_5/Page_Number_2.dart';

class PageNumber3 extends StatefulWidget {
  const PageNumber3({super.key});

  @override
  State<PageNumber3> createState() => _PageNumber3State();
}

class _PageNumber3State extends State<PageNumber3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Assignmnt 5"),

      ),
      drawer: SafeArea(child: Drawer(
        child: Column(
          children: [
            SizedBox(height: 50,),
            Container(width:double.infinity,child: ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>PageNumber1()));
            }, child: Text("Page 1"))),
            Container(width:double.infinity,child: ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>PageNumber2()));
            }, child: Text("Page 2"))),
          ],
        ),
      )),
      body: Container(
        child: Center(
          child: Text("This is Page Number 3",style: TextStyle(fontSize: 20),),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text("+"),onPressed: (){},
        backgroundColor: Colors.blue,
      ),
    );
  }
}
