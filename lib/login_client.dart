// TODO Implement this library.
// TODO Implement this library.
// TODO Implement this library.





import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:raniaproject/main.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:raniaproject/page_client.dart';

import 'package:raniaproject/reclamation.dart';
import 'package:raniaproject/signup_client.dart';

import 'constants.dart';
import 'liste_reclamation.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}



class _LoginPageState extends State<LoginPage> {
  var useremailsiginin, userpasswordsigin;
GlobalKey<FormState> redhawk = new GlobalKey<FormState>();

signin() async {
  var formdata = redhawk.currentState;
  if (formdata!.validate()) {
    formdata.save();
    print("mrigel");
    try {
      UserCredential userr = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: useremailsiginin, password: userpasswordsigin);
      return userr;
    } on FirebaseAuthException catch (e) {
       
    if (e.code == 'user-not-found') {
      AwesomeDialog(
              context: context, title: "error", body: Text('No user found for that email.'))..show();
     
    print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
     AwesomeDialog(
              context: context, title: "error", body: Text('Wrong password provided for that user.'))..show();
    print('Wrong password provided for that user.');
    
  }
    } 
  } 
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
          key: redhawk,
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
                            useremailsiginin = val;
                          },
                          validator: ((val) {
                            if (val!.length > 100) {
                              return "email can't be larged than 100 letter";
                            }
                            if (val.length < 7) {
                              return"email can't be less than 2 letter";
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
                            userpasswordsigin = val;
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
                          var sigii = await signin();
                          if (sigii != null) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => clientPage()));
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
                    children:  <Widget>[
                      Text("Don't have an account?",
                          style: TextStyle(
                            color: Colors.white,
                          )),
                     ElevatedButton (onPressed:  () {
                        Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignupPage()));
                        },
                     
                        child: Text(
                          
                          " Sign up",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Color.fromRGBO(255, 255, 255, 1),
                          ),
                        ),style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
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
