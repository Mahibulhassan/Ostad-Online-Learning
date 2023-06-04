import 'package:flutter/material.dart';
import 'package:ostad_flutter_assignmen_5/Page_Number_2.dart';
import 'package:ostad_flutter_assignmen_5/Page_Number_3.dart';

class PageNumber1 extends StatefulWidget {
 PageNumber1({super.key});
  @override
  State<PageNumber1> createState() => _PageNumber1State();
}

class _PageNumber1State extends State<PageNumber1> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Assignmnt 5"),
          bottom: TabBar(
            tabs: [
              InkWell(child: Tab(text:"page 1"),onTap: (){
              },),
              InkWell(child: Tab(text:"page 2"),onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>PageNumber2()));
              },),
              InkWell(child: Tab(text:"page 3"),onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>PageNumber3()));
              },),
            ],
          ),
        ),
        drawer: SafeArea(child: Drawer(
          child: Column(
            children: [
              SizedBox(height: 50,),
              Container(width:double.infinity,child: ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>PageNumber2()));
              }, child: Text("Page 2"))),
              Container(width:double.infinity,child: ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>PageNumber3()));
              }, child: Text("Page 3"))),
            ],
          ),
        )),
        body: Container(
          child: Center(
            child: Text("This is Page Number 1",style: TextStyle(fontSize: 20),),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Text("+"),onPressed: (){},
          backgroundColor: Colors.red,
        ),
      ),
    );
  }
}
