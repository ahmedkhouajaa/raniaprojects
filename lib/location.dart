import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  Position? _currentPosition;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  // Get the current location of the user
  _getCurrentLocation() async {
    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
         print(
        'LAT: ${_currentPosition!.latitude}, LNG: ${_currentPosition!.longitude}',
      );
        
      });
    }).catchError((e) {
      print(e);
      print(
        'LAT: ${_currentPosition!.latitude}, LNG: ${_currentPosition!.longitude}',
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location Screen'),
      ),
      body: Center(
        child: _currentPosition == null
            ? CircularProgressIndicator()
            : Text(
                'LAT: ${_currentPosition!.latitude}, LNG: ${_currentPosition!.longitude}',
                style: TextStyle(fontSize: 18),
              ),
              
      ),
    );
  }
}
