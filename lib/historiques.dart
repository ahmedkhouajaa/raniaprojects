import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:raniaproject/reclamation.dart';
import 'constants.dart';
import 'details_client.dart';

import 'NavBar.dart';

void getDocumentId(userID) async {
  String documentId = '';
  FirebaseFirestore.instance
      .collection('Reclamation')
      .where('userId', isEqualTo: userID)
      .limit(1)
      .get()
      .then((QuerySnapshot querySnapshot) async {
    if (querySnapshot.docs.isNotEmpty) {
      documentId = querySnapshot.docs.first.id;
      // Do something with the retrieved document ID
      print('## got doc ID = $documentId');

      /// add your code here
      await FirebaseFirestore.instance
          .collection("Reclamation")
          .doc(documentId)
          .update({
        "calimtitletek1": calimtitletek1,
        "calimtitletek2": calimtitletek2,
      });
    } else {
      print('## doc NOT found');

      // Document not found
    }
  });
}

class Historiques extends StatelessWidget {
  final notess;
  final docids;
  Historiques({this.notess, this.docids});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavBar(),
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          title: const Text('Historiques'),
          backgroundColor: kBackgroundColor,
        ),
        body: Container(
            child: FutureBuilder<QuerySnapshot>(
                future: FirebaseFirestore.instance
                    .collection("Reclamation")
                    .where("userId",
                        isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                    .get(),
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      reverse: true,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: ((context, index) {
                          return Column(
                            children: [
                              Container(
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
                                child: Column(
                                    
                                            
                                             
                                  children: [
                                         Padding(
                                           padding: const EdgeInsets.only(left: 50, right: 30),
                                           child: Row(
                                             children: [
                                               Column(
                                                
                                                 children: [
                                                  
                                                   Text(
                                                            "date D'enregistrement : ",
                                                            style: const TextStyle(fontSize: 15),
                                                      ),
                                                      
                                                  Text(
                                                    "${"${snapshot.data!.docs[index]['currenttime']}"}",
                                                    style: const TextStyle(fontSize: 10),
                                                  ),
                                                  Text(
                                                    "${"${snapshot.data!.docs[index]['currentdate']}"}",
                                                    style: const TextStyle(fontSize: 10),
                                                  ),
                                                 ],
                                               ),
                                               SizedBox(width: 50,),
                                               Text(
                                                    "${"${snapshot.data!.docs[index]['compteur']} h"}",
                                                    style: const TextStyle(fontSize: 20),)
                                             ],
                                           ),
                                         ),
                                    ListTile(
                                        onTap: () {
                                          // Navigate to Next Details
                                        },
                                        title:
                                            Text(
                                              "${"${snapshot.data!.docs[index]['clientName']}"}",
                                              style: const TextStyle(fontSize: 25),
                                            ),
                                         
                                          
                                        subtitle: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            const SizedBox(height: 10),
                                            const Icon(Icons.person,
                                                color: Colors.black, size: 30),
                                            Text(
                                              "${snapshot.data!.docs[index]['clientName']}",
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white),
                                            ),
                                            const SizedBox(height: 10),
                                            const Icon(Icons.phone_android,
                                                color: Colors.black, size: 30),
                                            Text(
                                              "${snapshot.data!.docs[index]['clientName']}",
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white),
                                            ),
                                            const SizedBox(height: 10),
                                            const Icon(Icons.location_on,
                                                color: Colors.black, size: 30),
                                            Text(
                                              "${snapshot.data!.docs[index]['clientName']}",
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white),
                                            ),
                                            const SizedBox(height: 10),
                                            const Icon(Icons.phone,
                                                color: Colors.black, size: 30),
                                            Text(
                                              "${snapshot.data!.docs[index]['clientName']}",
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white),
                                            ),
                                            const SizedBox(height: 10),
                                            const Icon(Icons.comment,
                                                color: Colors.black, size: 30),
                                            Text(
                                              "${snapshot.data!.docs[index]['clientName']}",
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white),
                                            ),
                                            const SizedBox(height: 10),
                                          ],
                                        )),
                                 ////   if (Text(
                                  //          "${snapshot.data!.docs[index]['calimtitleck1']}") ==
                                //        null)
                               //       Text("data wait")
                               //     else
                                      
                                 
                                      
                                    //     if ( teckrec == null)  Text("redd")
                                    //   else (Text( "${snapshot.data!.docs[index]['clientName']}"))
                                  ],
                                ),
                              ),
                            
                                     Text(
                              //
                                            "Type de déerengement : ${snapshot.data!.docs[index]['calimtitletek1']}",style: TextStyle(fontSize: 15),),
                                            SizedBox(height: 15,),


                                        Text(
                                            "Depser L'intervention:${snapshot.data!.docs[index]['calimtitletek2']}",style: TextStyle(fontSize: 15))
                            ],
                          );
                        }));
                  }
                  return CircularProgressIndicator();
                }))));
  }
}
