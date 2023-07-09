import 'package:assignment_module_9/Network/api_%20call.dart';
import 'package:assignment_module_9/weather_response.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
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
  //Variable
  ApiResponse res = ApiResponse("","", 0.0, "", 0.0, 0.0, 0.0);
  bool visi =false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Weather"),
        actions: [
          IconButton(onPressed: (){
          }, icon: Icon(Icons.settings)),
          IconButton(onPressed: (){}, icon: Icon(Icons.add)),
        ],
      ),
      body: Container(
        width: size.width*1 ,
        color: Colors.blue,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [

              Visibility(
                visible: visi,
                  child:Column(children: [
                Text("Current Location: "+res.location,style: const TextStyle(fontSize: 20,color: Colors.white),),
                const SizedBox(height: 5,),
                Text("Country: "+res.Country,style: const TextStyle(fontSize: 20,color: Colors.white),),
                const SizedBox(height: 5,),
                Text("Current Temparature Farenhite: "+res.temp.toString(),style: const TextStyle(fontSize: 20,color: Colors.white),),
                const SizedBox(height: 5,),
                Text("Min Temparature Farenhite: "+res.tempMin.toString(),style: const TextStyle(fontSize: 20,color: Colors.white),),
                const SizedBox(height: 5,),
                Text("Max Temparature Farenhite: "+res.tempMax.toString(),style: const TextStyle(fontSize: 20,color: Colors.white),),
                const SizedBox(height: 5,),
                Text("Weather Condition: "+res.condition,style: const TextStyle(fontSize: 20,color: Colors.white),),
                const SizedBox(height: 5,),
              ],) ),

              MaterialButton(onPressed: ()async{
                ProgressDialog pd = ProgressDialog(context: context);
                pd.show(max: 100, msg: 'Searching Weather Data');
                var data = await getGoogleLocation();
                var response =await WeatherApi().getApiResponse(data.latitude, data.longitude);
                setState(() {
                  pd.close();
                  res = response!;
                  visi =true;
                });
              },
                child: Text("Get Current Cordinate weather"),
                color: Colors.white70,),
              const SizedBox(height: 20,),

              Text("Amar Semister final Exm choltese ... Tai Ui Design e SOmoy dite pari nai.. Asa kori Assignment ta Network call er opor silo.. Full Number diya Consder kora hobe. ",style: TextStyle(fontSize: 30,color: Colors.white),),
            ],

          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  //Get Current Location
  Future<Position> getGoogleLocation() async{
    LocationPermission permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
    }
    if(permission == LocationPermission.denied){
      return Future.error("Location Service denied");
    }
    return Geolocator.getCurrentPosition();
  }
}
