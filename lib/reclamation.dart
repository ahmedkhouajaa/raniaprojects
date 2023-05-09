// TODO Implement this library.
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:raniaproject/main.dart';
import 'package:raniaproject/page_client.dart';
import 'package:timer_count_down/timer_count_down.dart';

class ClaimForm extends StatefulWidget {
  const ClaimForm({super.key});

  @override
  State<ClaimForm> createState() => _ClaimFormState();
}

Position? _currentPosition;
double? time = 48;

final _item = ['pas de tonalité ', 'bas débit ', 'autre '];
DateTime now = DateTime.now();
String formattedDate =
    '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';
String formattedTime =
    '${(now.hour + 1).toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}';

var currenttime,
    currentdate,
    homenumber,
    clientName,
    clientFirstName,
    clientaddress,
    phoneNumber,
    email,
    calimtitle,
    calimtitletek1 = "en attenete",
    calimtitletek2 = "en attenete",
    claimDescription;
GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

CollectionReference reclamation =
    FirebaseFirestore.instance.collection("Reclamation");
reclamations() async {
  var formdata = _formKey.currentState;

  if (formdata!.validate()) {
    formdata.save();
  }
  await reclamation.add({
    "compteur" : time,
    "currenttime": formattedDate,
    "currentdate": formattedTime,
    "homenumber": homenumber,
    "clientName": clientName,
    "clientFirstName": clientFirstName,
    "clientaddress": clientaddress,
    "phoneNumber": phoneNumber,
    "email": email,
    "calimtitle": calimtitle,
    "calimtitletek1": calimtitletek1,
    "calimtitletek2": calimtitletek2,
    "claimDescription": claimDescription,
    "lat": _currentPosition!.latitude.toString(),
    "lng": _currentPosition!.longitude.toString(),
    "userId": FirebaseAuth.instance.currentUser!.uid,
  });
}

class _ClaimFormState extends State<ClaimForm> {
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
    Countdown(
      // controller: _controller,
      seconds: 48,
      build: (_, double time) => Text(
        time.toString(),
        style: TextStyle(
          fontSize: 40,
        ),
      ),
      interval: Duration(hours: 10),
      onFinished: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Timer is done!'),
          ),
        );

        //   Navigator.push(
        //           context,
        //           MaterialPageRoute(
        //              builder: (context) => Firstscreen()));
      },
    );
  }

  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  get style => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulaire de réclamation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Numéro de téléphone fixe ',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez saisir votre numéro de téléphone fixe ';
                  }
                  return null;
                },
                onSaved: (value) {
                  homenumber = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'nom',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez saisir votre nom';
                  }
                  return null;
                },
                onSaved: (value) {
                  clientName = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'prénom',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez saisir votre prénom';
                  }
                  return null;
                },
                onSaved: (value) {
                  clientFirstName = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'addresse de la client ',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez saisir votre adresse';
                  }
                  return null;
                },
                onSaved: (value) {
                  clientaddress = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Numéro de contact ',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez saisir votre numéro de contact  ';
                  }
                  return null;
                },
                onSaved: (value) {
                  phoneNumber = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Adresse e-mail',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez saisir votre adresse e-mail';
                  }
                  return null;
                },
                onSaved: (value) {
                  email = value!;
                },
              ),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'title de réclamation',
                ),
                onChanged: (newValue) {
                  setState(() {
                    calimtitle = newValue!;
                  });
                },
                items: _item.map((String DropdownStringItem) {
                  return DropdownMenuItem<String>(
                    value: DropdownStringItem,
                    child: Text(DropdownStringItem),
                  );
                }).toList(),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Description de la réclamation',
                ),
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez saisir une description de la réclamation';
                  }
                  return null;
                },
                onSaved: (value) {
                  claimDescription = value!;
                },
              ),
              ElevatedButton(
                onPressed: () async {
                  await reclamations();

                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => clientPage())));
                },
                child: const Text('Soumettre la réclamation'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
