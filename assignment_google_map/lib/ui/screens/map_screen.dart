import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapScreen extends StatefulWidget {
      MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  //Variable part
  LatLng currentPosition = LatLng(0.0, 0.0);
  List<LatLng> _polyLinePoints = [];
  final Completer<GoogleMapController> _mapController = Completer();

  @override
  void initState() {
    getCurrentLocation();
  }


  //Code Section
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("Real-Time Location Tracker"),),
      body: Center(
        child: GoogleMap(
          initialCameraPosition: CameraPosition(target: currentPosition,
              zoom: 15),
          polylines: {
            Polyline(
              polylineId: PolylineId("Poly Line 1"),
              width: 7,
              color: Colors.blue,
              points: _polyLinePoints
            ),
          },
          markers: {
            Marker(
                markerId: MarkerId("My Location"),
                position: currentPosition,
                infoWindow: InfoWindow(
                  title: "My Current Location",
                  snippet: "${currentPosition.latitude},${currentPosition.longitude}"
                )
            ),
          },
          compassEnabled: true,
          onMapCreated: (mapController){
            _mapController.complete(mapController);
          },
        ),
      ),
    );
  }


  //Get Realtime Locations
  void getCurrentLocation() async{
    GoogleMapController gmapController = await _mapController.future;
    Location location = new Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    location.changeSettings(
      interval: 10000
    );
    location.onLocationChanged.listen((_locData) {
      _polyLinePoints.add(LatLng(_locData.latitude!, _locData.longitude!));
      setState(() {
        gmapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(_locData.latitude! ,_locData.longitude! ),zoom: 15)));
        currentPosition = LatLng(_locData.latitude!, _locData.longitude!);
      });
    });
  }
}
