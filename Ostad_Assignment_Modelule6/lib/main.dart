import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Center(child: Text("Photo Gallery")),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Center(child: Text("Welcome to My Photo Gallery!",style: TextStyle(fontSize: 20,color: Colors.black),)),
              ),
              SizedBox(height: 5,),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Row(
                    children: [
                      Icon(Icons.search_rounded),
                      SizedBox(width: 5,),
                      Text("Search"),
                    ],
                  )
                ),
              ),
              SizedBox(height: 10,
              ),
              Wrap(
                children: [
                  InkWell(
                    onTap: (){
                      final _snackbar = SnackBar(
                        content: Text("Click On Photo 1"),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(_snackbar);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Stack(
                          children: [
                            Container(
                                height: 120,
                                width: 120,
                                child: Image.network(
                                    "https://img.freepik.com/free-photo/wide-angle-shot-single-tree-growing-clouded-sky-during-sunset-surrounded-by-grass_181624-22807.jpg",fit: BoxFit.fill,)),
                            Positioned(
                                left: 10,
                                right: 10,
                                bottom: 0,
                                child: OutlinedButton(
                                  onPressed: (){
                                    final _snackbar = SnackBar(
                                      content: Text("Click On Photo 1"),
                                    );
                                    ScaffoldMessenger.of(context).showSnackBar(_snackbar);
                                  },
                                  child: Text("Caption",style: TextStyle(fontSize: 13,color: Colors.white),),
                                ))
                          ]),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      final _snackbar = SnackBar(
                        content: Text("Click On Photo 2"),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(_snackbar);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Stack(
                          children: [
                            Container(
                                height: 120,
                                width: 120,
                                child: Image.network(
                                  "https://img.freepik.com/free-photo/wide-angle-shot-single-tree-growing-clouded-sky-during-sunset-surrounded-by-grass_181624-22807.jpg",fit: BoxFit.fill,)),
                            Positioned(
                                left: 10,
                                right: 10,
                                bottom: 0,
                                child: OutlinedButton(
                                  onPressed: (){
                                    final _snackbar = SnackBar(
                                      content: Text("Click On Photo 2"),
                                    );
                                    ScaffoldMessenger.of(context).showSnackBar(_snackbar);
                                  },
                                  child: Text("Caption",style: TextStyle(fontSize: 13,color: Colors.white),),
                                ))
                          ]),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      final _snackbar = SnackBar(
                        content: Text("Click On Photo 3"),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(_snackbar);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Stack(
                          children: [
                            Container(
                                height: 120,
                                width: 120,
                                child: Image.network(
                                  "https://img.freepik.com/free-photo/wide-angle-shot-single-tree-growing-clouded-sky-during-sunset-surrounded-by-grass_181624-22807.jpg",fit: BoxFit.fill,)),
                            Positioned(
                                left: 10,
                                right: 10,
                                bottom: 0,
                                child: OutlinedButton(
                                  onPressed: (){
                                    final _snackbar = SnackBar(
                                      content: Text("Click On Photo 3"),
                                    );
                                    ScaffoldMessenger.of(context).showSnackBar(_snackbar);
                                  },
                                  child: Text("Caption",style: TextStyle(fontSize: 13,color: Colors.white),),
                                ))
                          ]),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      final _snackbar = SnackBar(
                        content: Text("Click On Photo 4"),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(_snackbar);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Stack(
                          children: [
                            Container(
                                height: 120,
                                width: 120,
                                child: Image.network(
                                  "https://img.freepik.com/free-photo/wide-angle-shot-single-tree-growing-clouded-sky-during-sunset-surrounded-by-grass_181624-22807.jpg",fit: BoxFit.fill,)),
                            Positioned(
                                left: 10,
                                right: 10,
                                bottom: 0,
                                child: OutlinedButton(
                                  onPressed: (){
                                    final _snackbar = SnackBar(
                                      content: Text("Click On Photo 4"),
                                    );
                                    ScaffoldMessenger.of(context).showSnackBar(_snackbar);
                                  },
                                  child: Text("Caption",style: TextStyle(fontSize: 13,color: Colors.white),),
                                ))
                          ]),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      final _snackbar = SnackBar(
                        content: Text("Click On Photo 5"),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(_snackbar);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Stack(
                          children: [
                            Container(
                                height: 120,
                                width: 120,
                                child: Image.network(
                                  "https://img.freepik.com/free-photo/wide-angle-shot-single-tree-growing-clouded-sky-during-sunset-surrounded-by-grass_181624-22807.jpg",fit: BoxFit.fill,)),
                            Positioned(
                                left: 10,
                                right: 10,
                                bottom: 0,
                                child: OutlinedButton(
                                  onPressed: (){
                                    final _snackbar = SnackBar(
                                      content: Text("Click On Photo 5"),
                                    );
                                    ScaffoldMessenger.of(context).showSnackBar(_snackbar);
                                  },
                                  child: Text("Caption",style: TextStyle(fontSize: 13,color: Colors.white),),
                                ))
                          ]),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      final _snackbar = SnackBar(
                        content: Text("Click On Photo 6"),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(_snackbar);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Stack(
                          children: [
                            Container(
                                height: 120,
                                width: 120,
                                child: Image.network(
                                  "https://img.freepik.com/free-photo/wide-angle-shot-single-tree-growing-clouded-sky-during-sunset-surrounded-by-grass_181624-22807.jpg",fit: BoxFit.fill,)),
                            Positioned(
                                left: 10,
                                right: 10,
                                bottom: 0,
                                child: OutlinedButton(
                                  onPressed: (){
                                    final _snackbar = SnackBar(
                                      content: Text("Click On Photo 6"),
                                    );
                                    ScaffoldMessenger.of(context).showSnackBar(_snackbar);
                                  },
                                  child: Text("Caption",style: TextStyle(fontSize: 13,color: Colors.white),),
                                ))
                          ]),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5,),
              ListView.builder(itemCount: 3,
                shrinkWrap: true,
                itemBuilder: (context,index){
                return ListTile(
                  leading: Image.network(
                    "https://img.freepik.com/free-photo/wide-angle-shot-single-tree-growing-clouded-sky-during-sunset-surrounded-by-grass_181624-22807.jpg",fit: BoxFit.fill,),
                  title: Text("Sample Photo $index"),
                  subtitle: Text("Catagory $index"),
                );
                },

              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        onPressed: (){
         final _snackbar = SnackBar(
            content: Text("Photos Uploaded Successfully!"),
          );
         ScaffoldMessenger.of(context).showSnackBar(_snackbar);
        },
        child: Icon(Icons.cloud_upload_rounded,color: Colors.white,),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
