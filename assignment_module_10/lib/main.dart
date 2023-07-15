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
      title: 'Flutter Demo',
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
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text("Profile"),
      ),
      body: MediaQuery.of(context).orientation == Orientation.portrait ? potredMode(size):landScape(size) , // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget potredMode(Size size){
    return SingleChildScrollView(
      child: Column(
        children: [
          CircleAvatar(
            maxRadius: size.height*0.25,
            backgroundImage: AssetImage("images/eventPhoto.jpeg"),
          ),
          Text("John Doe",style: const TextStyle(color: Colors.black,fontSize: 20),),
          Text("Nothing to Say About Him ,,, ....."),
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemCount: 6,itemBuilder: (context,intex){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: CircleAvatar(
                  backgroundImage: AssetImage("images/eventPhoto.jpeg"),
                ),
              ),
            );
          },),
        ],
      ),
    );
  }

  Widget landScape (Size size){
    return Row(
      children: [
        CircleAvatar(
          maxRadius: size.height*0.4,
          backgroundImage: AssetImage("images/eventPhoto.jpeg"),
        ),
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("John Doe",style: const TextStyle(color: Colors.black,fontSize: 20),),
              Text("Nothing to Say About Him ,,, ....."),
              Row(
                children: [
                  Padding(padding: EdgeInsets.all(8),
                  child: CircleAvatar(
                    maxRadius: size.height*0.18,
                    backgroundImage: AssetImage("images/eventPhoto.jpeg"),
                  ),),
                  Padding(padding: EdgeInsets.all(8),
                  child: CircleAvatar(
                    maxRadius: size.height*0.18,
                    backgroundImage: AssetImage("images/eventPhoto.jpeg"),
                  ),),
                  Padding(padding: EdgeInsets.all(8),
                  child: CircleAvatar(
                    maxRadius: size.height*0.18,
                    backgroundImage: AssetImage("images/eventPhoto.jpeg"),
                  ),),

                ],
              ),
              Row(
                children: [
                  Padding(padding: EdgeInsets.all(8),
                  child: CircleAvatar(
                    maxRadius: size.height*0.18,
                    backgroundImage: AssetImage("images/eventPhoto.jpeg"),
                  ),),
                  Padding(padding: EdgeInsets.all(8),
                  child: CircleAvatar(
                    maxRadius: size.height*0.18,
                    backgroundImage: AssetImage("images/eventPhoto.jpeg"),
                  ),),
                  Padding(padding: EdgeInsets.all(8),
                  child: CircleAvatar(
                    maxRadius: size.height*0.18,
                    backgroundImage: AssetImage("images/eventPhoto.jpeg"),
                  ),),

                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

