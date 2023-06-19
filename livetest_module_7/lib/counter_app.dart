import 'package:flutter/material.dart';
import 'package:livetest_module_7/secondScreen.dart';

class CounterApp extends StatefulWidget {
  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  //Variable
  int _countervalue = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title:  const Text("Counter App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height:size.height*0.4 ,),
            const Text("Counter value ",style: TextStyle(fontSize: 16),),
            Text(_countervalue.toString(),style: TextStyle(fontSize: 25,color: Colors.black),),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    Flexible(
                      flex: 2,
                        fit: FlexFit.tight,
                        child: ElevatedButton(onPressed: (){
                          if(_countervalue == 4){
                            openDialouge(context);
                          }
                          if(_countervalue == 9){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> SecondPage()));
                          }
                          setState(() {
                            _countervalue+=1;
                          });
                        },child: Text("+",style: TextStyle(fontSize: 20),),style:ElevatedButton.styleFrom(primary: Colors.green),)),
                   SizedBox(width: 5,),
                   Flexible(
                     fit: FlexFit.tight,
                     flex: 1,
                       child: ElevatedButton(onPressed: (){
                         setState(() {
                           _countervalue-=1;
                         });
                       },child: Text("-",style: TextStyle(fontSize: 20),),style:ElevatedButton.styleFrom(primary: Colors.red),)),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }




  //Alart Dialouge.....
  static Future openDialouge(BuildContext context) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Counter Alert !"),
        content: Text("Counter Valur is 5"),
        actions: [
          TextButton(onPressed: () {
            Navigator.pop(context);
          }, child: const Text("ok"))
        ],
      ));
}
