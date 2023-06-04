import 'package:flutter/material.dart';
import 'package:ostad_flutter_assignmen_5/Page_Number_1.dart';
import 'Page_Number_3.dart';

class PageNumber2 extends StatefulWidget {
  const PageNumber2({super.key});

  @override
  State<PageNumber2> createState() => _PageNumber2State();
}

class _PageNumber2State extends State<PageNumber2> {
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
              Navigator.push(context, MaterialPageRoute(builder: (context)=>PageNumber3()));
            }, child: Text("Page 3"))),
          ],
        ),
      )),
      body: Container(
        child: Center(
          child: Text("This is Page Number 2",style: TextStyle(fontSize: 20),),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text("+"),onPressed: (){},
        backgroundColor: Colors.green,
      ),
    );
  }
}
