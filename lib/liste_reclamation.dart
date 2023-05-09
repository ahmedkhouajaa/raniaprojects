// TODO Implement this library.
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'details_client.dart';

import 'NavBar.dart';

CollectionReference reclamation =
    FirebaseFirestore.instance.collection("Reclamation");

class Buying extends StatelessWidget {
  Buying({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavBar(),
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          title: const Text('liste de réclamation'),
          backgroundColor: kBackgroundColor,
        ),
        body: Container(
            child: FutureBuilder<QuerySnapshot>(
                future: reclamation.get(),
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        reverse: true,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: ((context, index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
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
                                      builder: (context) => DetailsPage(
                                          notes: snapshot.data!.docs[index]),
                                    ));
                              },
                              trailing: const Icon(Icons.arrow_forward,
                                  color: Colors.black, size: 39),
                              title: Text(
                                "${snapshot.data!.docs[index]['clientName']}",
                                style: const TextStyle(
                                    fontSize: 30, color: Colors.white),
                              ),
                              subtitle: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "${snapshot.data!.docs[index]['clientFirstName']}",
                                    style: const TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                  const SizedBox(height: 10),
                                  SizedBox(
                                    height: 40,
                                    child: Stack(
                                      children: <Widget>[
                                        Positioned(
                                          left: 0,
                                          bottom: 0,
                                          child: CircleAvatar(
                                              backgroundColor: Colors.white,
                                              child: Text(
                                                "${snapshot.data!.docs[index]['homenumber']}",
                                                style: const TextStyle(
                                                    fontSize: 25,
                                                    color: Colors.black),
                                              )),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }));
                  }
                  return CircularProgressIndicator();
                }))));
  }
}


//Text(
           //                 "${snapshot.data!.docs[index].data()}",
             //             );


             