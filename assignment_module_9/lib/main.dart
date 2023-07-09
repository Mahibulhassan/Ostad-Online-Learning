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
  ApiResponse res = ApiResponse("","", 0, "", 0, 0, 0,"");
  var hour;
  var minute;
  bool _visibility = false;
  @override
  void initState() {
    getWeatherDetails();
    super.initState();
  }

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
        color: Colors.deepPurple,
        child: Visibility(
          visible: _visibility,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: size.height*.2,),
                Text(res.location,style: TextStyle(fontSize: 20,color: Colors.white),),
                Text("Updated : ${hour.toString()} : ${minute.toString()}",style: TextStyle(fontSize: 16,color: Colors.white70),),
                SizedBox(height: size.height*.05,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: 100,width: 100,child: Image.network("https://api.openweathermap.org/img/w/${res.icon}",fit: BoxFit.fill,),),
                    Text(res.temp.toString()+"°",style: TextStyle(fontSize: 30,color: Colors.white),),
                    Column(
                      children: [
                        Text("Max :"+res.tempMax.toString()+"°",style: TextStyle(fontSize: 20,color: Colors.white70),),
                        Text("Min :"+res.tempMin.toString()+"°",style: TextStyle(fontSize: 20,color: Colors.white70),),
                      ],
                    )
                  ],
                ),
                Text(res.condition,style: TextStyle(fontSize: 20,color: Colors.white),)
              ],

            ),
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

  void getWeatherDetails() async {
    var data = await getGoogleLocation();
    var response =await WeatherApi().getApiResponse(data.latitude, data.longitude,context);
    hour = DateTime.now().hour;
    minute = DateTime.now().minute;
    setState(() {
      res = response!;
      _visibility= true;
    });
  }
}
