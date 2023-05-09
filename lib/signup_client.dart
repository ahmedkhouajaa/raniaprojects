import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'constants.dart';
import 'login_client.dart';

class SignupPage extends StatefulWidget {
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  var usernamees, passswordtek, useremailtek;
  String errortewt = " ";

  GlobalKey<FormState> techhawk = new GlobalKey<FormState>();
  CollectionReference client =
      FirebaseFirestore.instance.collection("client");
  vale() async {
    await client.add({
      'username': usernamees,
      "usernemail": useremailtek,
      "userId": FirebaseAuth.instance.currentUser!.uid,
    });
  }

  signup() async {
   
    var formdata = techhawk.currentState;

    if (formdata!.validate()) {
      print('## pass');
      formdata.save();

      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: useremailtek,
          password: passswordtek,
        );
        return credential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          AwesomeDialog(
              context: context,
              title: "error",
              body: Text('The password provided is too weak.'))
            ..show();

          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          AwesomeDialog(
              context: context,
              title: "error",
              body: Text('The account already exists for that email.'))
            ..show();
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    } else {
      if (usernamees == '') {
        AwesomeDialog(
            context: context, title: "error", body: Text(' namecant be empty '))
          ..show();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            height: MediaQuery.of(context).size.height - 50,
            width: double.infinity,
            child: Form(
              key: techhawk,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Container(
                      height: MediaQuery.of(context).size.height / 4,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/2.png"),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      const Text(
                        "Sign up",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Create an account, It's free ",
                        style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 16),
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          onSaved: (Value) {
                            usernamees = Value;
                          },
                          validator: (Value) {
                            if (Value!.isEmpty) {
                              AwesomeDialog(
                                  context: context,
                                  title: "error",
                                  body: Text('aa jhon.'));
                              return 'Veuillez saisir votre prénom';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: "Username ",
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
                          Icons.email,
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          onSaved: (Value) {
                            useremailtek = Value;
                          },
                          validator: ((Value) {
                            if (Value!.length > 100) {
                              return "email can't be larged than 100 letter";
                            }
                            if (Value.length < 7) {
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
                          onSaved: (Value) {
                            passswordtek = Value;
                          },
                          validator: ((Value) {
                            if (Value!.length > 100) {
                              return "passs is weak";
                            }
                            if (Value.length < 7) {
                              return "pass is heih";
                            }
                            return null;
                          }),
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: "password ",
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
                    children: const <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 16),
                        child: Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: "Confirm password ",
                              hintStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              )),
                        ),
                      ),
                    ],
                  ),
                  Container(
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
                        await vale();
                        var usered = await signup();
                        if (usered != null) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => LoginPage())));
                        }
                      },
                      color: const Color(0xFFFF5722),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Text(
                        "Sign up",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Text("Already have an account?"),
                      Text(
                        " Login",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return const LoginPage();
                            },
                          ));
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
