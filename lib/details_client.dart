// TODO Implement this library.

import 'dart:async';
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:raniaproject/map.dart';
import 'package:raniaproject/reclamation.dart';

import 'NavBar.dart';
import 'chatbot.dart';
import 'constants.dart';
import 'historiques.dart';
import 'liste_reclamation.dart';

CollectionReference teckrec =
    FirebaseFirestore.instance.collection("Tecknicienrecust");
teckrecl() async {
  await teckrec.doc().set(
      {"calimtitletek1": calimtitletek1, "calimtitletek2": calimtitletek2});
}

class DetailsPage extends StatefulWidget {
  @override
  final notes;
  final docid;
  DetailsPage({this.notes, this.docid});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

final _item1 = [
  'isolement ',
  'boucle ',
  'Courant étranger ',
  'friture',
  'perte de terre'
];
final _item2 = [
  'Changer Rosace ',
  'Changer cable ',
  'Permutaion De Ligne ',
];

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavBar(),
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          title: const Text('details'),
          backgroundColor: kBackgroundColor,
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            
            Container(
              height: 470,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                color: const Color(0xFFE64A19),
                borderRadius: BorderRadius.circular(13),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black,
                      blurRadius: 10,
                      spreadRadius: 3,
                      offset: Offset(3, 4))
                ],
              ),
              child: ListTile(
                
                onTap: () {
                  // Navigate to Next Details
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Maps(
                              lat: double.parse(widget.notes['lat']),
                              lng: double.parse(widget.notes['lng']))));
                },
                
                title: Text(
                  "${""}",
                  style: const TextStyle(fontSize: 25),
                ),
                subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                     Padding(
                                          padding: const EdgeInsets.only(left: 15, right: 30),
                                           child: Row(
                                             children: [
                                               Column(
                                                
                                                 children: [
                                                  
                                                   Text(
                                                            "date D'enregistrement : ",
                                                            style: const TextStyle(fontSize: 15),
                                                      ),
                                                      
                                                  Text(
                                                    "${"${widget.notes['currenttime']}"}",
                                                    style: const TextStyle(fontSize: 10),
                                                  ),
                                                  Text(
                                                    "${"${widget.notes['currentdate']}"}",
                                                    style: const TextStyle(fontSize: 10),
                                                  ),
                                                 ],
                                               ),
                                               SizedBox(width: 50,),
                                               Text(
                                                    "${"${widget.notes['compteur']} h"}",
                                                    style: const TextStyle(fontSize: 20),)
                                             ],
                                           ),
                                         ),
                    
                    const SizedBox(height: 10),
                    const Icon(Icons.person, color: Colors.black, size: 30),
                    Text(
                      "${widget.notes['clientName']}",
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    const Icon(Icons.phone_android,
                        color: Colors.black, size: 30),
                    Text(
                      "${widget.notes['phoneNumber']}",
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    const Icon(Icons.location_on,
                        color: Colors.black, size: 30),
                    Text(
                      "${widget.notes['clientaddress']}",
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    const Icon(Icons.phone, color: Colors.black, size: 30),
                    Text(
                      "${widget.notes['claimDescription']}",
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    const Icon(Icons.comment, color: Colors.black, size: 30),
                    Text(
                      "${widget.notes['homenumber']}",
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
              child: DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'title de réclamation',
                ),
                onChanged: (newValue) {
                  setState(() {
                    calimtitletek1 = newValue!;
                  });
                },
                items: _item1.map((String DropdownStringItem) {
                  return DropdownMenuItem<String>(
                    value: DropdownStringItem,
                    child: Text(DropdownStringItem),
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
              child: DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'title de réclamation',
                ),
                onChanged: (newValue) {
                  setState(() {
                    calimtitletek2 = newValue!;
                  });
                },
                items: _item2.map((String DropdownStringItem) {
                  return DropdownMenuItem<String>(
                    value: DropdownStringItem,
                    child: Text(DropdownStringItem),
                  );
                }).toList(),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                getDocumentId(FirebaseAuth.instance.currentUser!.uid);
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Buying()));
                //await teckrecl();
              },
              child: Text(
                " submit",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
            )
          ],
        ));
  }
}

class Maps extends StatefulWidget {
  final lat;
  final lng;

  Maps({this.lat = 0, this.lng = 0});

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  CollectionReference reclamation =
      FirebaseFirestore.instance.collection("Reclamation");

  Completer<GoogleMapController> _controller = Completer();
  late GoogleMapController newGoogleMapController;

  // late CameraPosition posit;

  BitmapDescriptor? customIcon;

  late Position cl;
  var lat, amp;
  late Set<Marker> marker = {
    Marker(
      markerId: MarkerId("an"),
      infoWindow: InfoWindow(title: "an"),
      position: LatLng(37.4255, -122.1855),
    )
  };

  setmarker() async {
    marker.add(Marker(
      markerId: MarkerId("an"),
      infoWindow: InfoWindow(title: "an"),
      position: LatLng(37.4255, -122.0855),
      // icon: customIcon ?? BitmapDescriptor.defaultMarker,
      //     icon: BitmapDescriptor.fromBytes(markerIcon)),
    ));
  }

  pos() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    cl = await Geolocator.getCurrentPosition().then((value) => value);
    amp = cl.latitude;
    lat = cl.longitude;
    //                 posit = CameraPosition(
    // target: LatLng(22.2, 25.5),
    //  zoom: 14.4746,

    // );

    setState(() {});
  }

  @override
  void initState() {
    //pos();
    //setmarker();
    // marker = Set.from([]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            children: [
              Text("${['homenumber']}"),
              IconButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ChatPage()));
                  },
                  icon: Icon(Icons.exit_to_app))
            ],
          )
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: 450,
            width: double.infinity,
            child: GoogleMap(
              markers: {
                Marker(
                  markerId: MarkerId("an"),
                  infoWindow: InfoWindow(title: "an"),
                  position: LatLng(widget.lat, widget.lng),
                )
              },
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: LatLng(widget.lat, widget.lng),
                zoom: 14.4746,
              ),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(height: 30),
          Center(
              child: Row(children: [
            SizedBox(
              width: 30,
            ),
          ]))
        ],
      ),
    );
  }
}
