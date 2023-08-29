import 'package:assignment_google_map/ui/screens/map_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainScreen());
}

class MainScreen extends StatelessWidget {
  static GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      navigatorKey: globalKey,
      debugShowCheckedModeBanner: false,
      home: MapScreen(),
    );
  }

}


