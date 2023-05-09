import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:raniaproject/main.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:raniaproject/reclamation.dart';

import 'constants.dart';
import 'liste_reclamation.dart';

class LoginTech extends StatefulWidget {
  const LoginTech({super.key});

  @override
  State<LoginTech> createState() => _LoginTechState();
}

class _LoginTechState extends State<LoginTech> {
  var techemailsiginin, techpasswordsigin;
  GlobalKey<FormState> techhawk = new GlobalKey<FormState>();

  DocumentReference teck = FirebaseFirestore.instance
      .collection("techsigin")
      .doc("ycA19KgvL0yA1pgzwGeB");

  void getDocumentId(techemailsiginin) async {
    String documentId = '';
    FirebaseFirestore.instance
        .collection('techsigin')
        .where('email', isEqualTo: techemailsiginin)
        .limit(1)
        .get()
        .then((QuerySnapshot querySnapshot) async {
      if (querySnapshot.docs.isNotEmpty) {
        documentId = querySnapshot.docs.first.id;
        // Do something with the retrieved document ID
        print('## got doc ID = $documentId');
        querySnapshot.docs.first["email"];

        /// add your code here
      } else {
        print('## doc NOT found');

        // Document not found
      }
    });
  }

  signin() async {
    String documentId = '';
    var formdata = techhawk.currentState;
    FirebaseFirestore.instance
        .collection('techsigin')
        .where('email', isEqualTo: techemailsiginin)
        .limit(1)
        .get()
        .then((QuerySnapshot querySnapshot) async {
      if (querySnapshot.docs.isNotEmpty) {
        documentId = querySnapshot.docs.first.id;
        // Do something with the retrieved document ID
        print('## got doc ID = $documentId');
        var redd = querySnapshot.docs.first["email"];
        if (formdata!.validate()) {
          formdata.save();
          print("mrigel");
          try {
            if (email == teck && techemailsiginin == redd) {}
            ;
            UserCredential techh = await FirebaseAuth.instance
                .signInWithEmailAndPassword(
                    email: techemailsiginin, password: techpasswordsigin);
            return techh;
          } on FirebaseAuthException catch (e) {
            if (e.code == 'user-not-found') {
              AwesomeDialog(
                  context: context,
                  title: "error",
                  body: Text('No user found for that email.'))
                ..show();

              print('No user found for that email.');
            } else if (e.code == 'wrong-password') {
              AwesomeDialog(
                  context: context,
                  title: "error",
                  body: Text('Wrong password provided for that user.'))
                ..show();
              print('Wrong password provided for that user.');
            }
          }
        }

        /// add your code here
      } else {
        print('## doc NOT found');

        // Document not found
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kBackgroundColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: kPrimaryColor,
          ),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Form(
          key: techhawk,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Container(
                      height: MediaQuery.of(context).size.height / 2,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/2.png"),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: const <Widget>[
                      Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        " to your account",
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 16),
                        child: Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          onSaved: (val) {
                            techemailsiginin = val;
                          },
                          validator: ((val) {
                            if (val!.length > 100) {
                              return "email can't be larged than 100 letter";
                            }
                            if (val.length < 7) {
                              return "email can't be less than 2 letter";
                            }
                            return null;
                          }),
                          decoration: InputDecoration(
                              hintText: "Email ",
                              hintStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              )),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 16),
                        child: Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          onSaved: (val) {
                            techpasswordsigin = val;
                          },
                          validator: ((val) {
                            if (val!.length > 100) {
                              return "passs is weak";
                            }
                            if (val.length < 7) {
                              return "pass is heih";
                            }
                            return null;
                          }),
                          decoration: InputDecoration(
                              hintText: "Password",
                              hintStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              )),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Container(
                      padding: const EdgeInsets.only(top: 3, left: 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: const Border(
                            bottom: BorderSide(color: Colors.black),
                            top: BorderSide(color: Colors.black),
                            left: BorderSide(color: Colors.black),
                            right: BorderSide(color: Colors.black),
                          )),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: () async {
                          var sigi = await signin();
                          if (sigi != null) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Buying()));
                          }
                        },
                        color: const Color(0xFFFF5722),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Row(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                            ),
                          ),
                          child: const Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                            ),
                          ),
                          child: const Icon(
                            Icons.facebook,
                            color: Colors.white,
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Text("Don't have an account?",
                          style: TextStyle(
                            color: Colors.white,
                          )),
                      Text(
                        " Sign up",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: GestureDetector(
                        onTap: () async {
                          var userss = await signin();
                          if (userss != null) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => HomePage())));
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFFF5722),
                          ),
                          child: const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        )),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 100),
                    height: 200,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/background.png"),
                          fit: BoxFit.fitHeight),
                    ),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
