import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MatchDetailsScreen extends StatefulWidget {
  String title;
  MatchDetailsScreen({super.key , required this.title});

  @override
  State<MatchDetailsScreen> createState() => _MatchDetailsScreenState();
}

class _MatchDetailsScreenState extends State<MatchDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("matchs").doc(widget.title).snapshots(),
        builder: (context,AsyncSnapshot<DocumentSnapshot<Object?>> snapShort){
          if (snapShort.hasError) {
            return Text('Something went wrong');
          }
          if (snapShort.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final data = snapShort.data;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: size.height*0.20,
              width: double.infinity,
              child: Card(
                elevation: 5,
                child: Column(
                  children: [
                    Text(data!.get('titel'),style: const TextStyle(fontSize: 40),),
                    Text(data!.get('score'),style: const TextStyle(fontSize: 30),),
                    Text(data!.get('runTime'),style: const TextStyle(fontSize: 25),),
                    Text(data!.get('fulTime'),style: const TextStyle(fontSize: 20),),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
