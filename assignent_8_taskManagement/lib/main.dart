import 'package:assignent_8_taskmanagement/data_class/data_class.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Management',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
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
   List<TaskData> tasks =[];
   final _titelController = TextEditingController();
   final _descriptionController = TextEditingController();
   final _remainingController = TextEditingController();

  //Code Part
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title:const Center(child: Text('Task Management')),
      ),
      body: ListView.builder(

        itemCount: tasks.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: InkWell(
              onLongPress: (){
                Scaffold.of(context).showBottomSheet<void>((BuildContext context){
                  return Container(
                    height: size.height*0.3,
                    width: size.width*1,
                    color: Colors.white70,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Task Details",style: TextStyle(fontSize: 18,color: Colors.black),),
                          const SizedBox(height: 10,),
                          Text("Titel : ${tasks[index].titel}"),
                          const SizedBox(height: 10,),
                          Text("Description : ${tasks[index].description}"),
                          const SizedBox(height: 10,),
                          Text(tasks[index].date),
                          const SizedBox(height: 10,),
                          ElevatedButton(onPressed: (){
                            Navigator.pop(context);
                            tasks.removeAt(index);
                            setState(() {});
                          }, child: const Text("Delet"))
                        ],
                      ),
                    ),
                  );
                });
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(tasks[index].titel,style: const TextStyle(fontSize: 18,color: Colors.black),),
                  Text(tasks[index].description,style: const TextStyle(fontSize: 16,color: Colors.black54),),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
            openDialouge(context,size);
        },
        tooltip: 'AddTasks',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }


   //Alart Dialouge.....
   void openDialouge(var context,Size size) => showDialog(
       context: context,
       builder: (context) => AlertDialog(
         title: const Text("Add Task"),
         content: SizedBox(
           height: size.height*.27,
           child: Column(
             children: [
               TextField(
                 controller: _titelController,
                 decoration:const InputDecoration(
                   border:OutlineInputBorder(),
                   hintText: "Titel",
                 ),
               ),
              const SizedBox(height: 5,),
               TextField(
                 controller: _descriptionController,
                 maxLines: 3,
                 decoration:const InputDecoration(
                   hintText: "Description",
                   border:OutlineInputBorder()
                 ),
               ),
              const SizedBox(height: 5,),
               TextField(
                 controller: _remainingController,
                 keyboardType: TextInputType.number,
                 decoration:const InputDecoration(
                   hintText: "Required Days Left",
                   border:OutlineInputBorder()
                 ),
               ),
             ],
           ),
         ),
         actions: [
           TextButton(onPressed: () {
             if(_titelController.text.isEmpty || _descriptionController.text.isEmpty || _remainingController.text.isEmpty){
                 print("Empty");
             }
             else{
               Navigator.pop(context);
               tasks.add(TaskData(_titelController.text, _descriptionController.text, "Day Requred : ${_remainingController.text}"));
               _titelController.clear();
               _descriptionController.clear();
               _remainingController.clear();
               setState(() {});
             }
           }, child: const Text("Save"))
         ],
       ));

}

