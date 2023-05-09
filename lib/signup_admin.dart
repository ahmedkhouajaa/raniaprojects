// TODO Implement this library.
// TODO Implement this library.
// TODO Implement this library.
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'constants.dart';
import 'login_client.dart';

class Signupadmin extends StatefulWidget {
  const Signupadmin({super.key});

  @override
  State<Signupadmin> createState() => _SignupadminState();
}



GlobalKey<FormState> adminhawk = new GlobalKey<FormState>();
CollectionReference Admin =
    FirebaseFirestore.instance.collection("Admin");
vale() async {
  await Admin.add({
    "username" : "useremail",
    "userId": FirebaseAuth.instance.currentUser!.uid,
    });
}

signupadmin() async {
  var formdata = adminhawk.currentState;

  if (formdata!.validate()) {
    formdata.save();

    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: "useremails",
        password: "passswords",
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  } else {
    print('vvvv');
  }
}


class _SignupadminState extends State<Signupadmin> {
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
          icon: const Icon(Icons.arrow_back_ios,
            size: 20,
            color: kPrimaryColor,),


        ),
      ),
      body: SingleChildScrollView(
        child: Container(

          padding: const EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,

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

                  const Text("Sign up",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,

                    ),),
                  const SizedBox(height: 20,),
                  Text("Create an account, It's free ",
                    style: TextStyle(
                        fontSize: 15,
                        color:Colors.grey[700]),)


                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(

                    child: TextField(

                      decoration: InputDecoration(
                          hintText: "Username ",hintStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.white,)
                      ),
                    ),
                  ),
                ], ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(

                    child: TextField(

                      decoration: InputDecoration(
                          hintText: "Email ",hintStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.white,)
                      ),
                    ),
                  ),
                ], ),
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
                          hintText: "password ",hintStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.white,)
                      ),
                    ),
                  ),
                ], ),
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
                          hintText: "Confirm password ",hintStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.white,)
                      ),
                    ),
                  ),
                ], ),

              Container(
                padding: const EdgeInsets.only(top: 3, left: 3),
                decoration:
                BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: const Border(
                      bottom: BorderSide(color: Colors.black),
                      top: BorderSide(color: Colors.black),
                      left: BorderSide(color: Colors.black),
                      right: BorderSide(color: Colors.black),



                    )

                ),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {},
                  color: const Color(0xFFFF5722),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),

                  ),
                  child: const Text(
                    "Sign up", style: TextStyle(
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
                  Text(" Login", style:TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18
                  ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child:GestureDetector(

                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const LoginPage();
                        },
                      ));
                    }, child:

                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFFF5722),
                  ),
                  child: const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                )
                ),
              ),





            ],

          ),


        ),

      ),

    );
  }
}



