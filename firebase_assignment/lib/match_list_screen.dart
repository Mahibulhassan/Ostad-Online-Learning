import 'package:firebase_assignment/match_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Stream<QuerySnapshot> _matchsStream = FirebaseFirestore.instance.collection('matchs').snapshots(includeMetadataChanges: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Match List"),
      ),
      body:StreamBuilder<QuerySnapshot>(
        stream: _matchsStream,
        builder: (context , AsyncSnapshot<QuerySnapshot> snapshot){
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
              return ListTile(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> MatchDetailsScreen(title: data['titel'])));
                },
                title: Text(data['titel'],style: const TextStyle(fontSize: 30),),
                trailing: Icon(Icons.arrow_forward)
              );
            }).toList(),
          );
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}