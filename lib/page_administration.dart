// TODO Implement this library.
import 'package:flutter/material.dart';

//import 'chatbot.dart';
import 'constants.dart';
import 'login_admin.dart';
//import 'reclamation.dart';
import 'signup_admin.dart';


class adminPage extends StatelessWidget {
  const adminPage({super.key});



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
          icon: const Icon(Icons.arrow_back_ios,
            size: 20,
            color: kPrimaryColor,),


        ),
      ),
      body: SafeArea(

        child: Container(

          // we will give media query height
          // double.infinity make it big as my parent allows
          // while MediaQuery make it big as per the screen

          width: double.infinity,
          height: MediaQuery
              .of(context)
              .size
              .height,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(

            // even space distribution
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              Column(
                children: const <Widget>[

                  Text(
                    "Welcome To ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,

                    ),

                  ),

                  SizedBox(
                    height: 20,
                  ),

                ],

              ),
              Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 5,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/1.png")
                    )
                ),
              ),
              Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 5,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/welcome.png")
                    )
                ),
              ),
              Column(
                children: <Widget>[
                  // the login button
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                     Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>
                          const Loginadmin()));
                    },
                    color: const Color(0xFFE64A19),
                    // defining the shape
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            color: Colors.black
                        ),
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: const Text(
                      "Log in",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18
                      ),
                    ),
                  ),
                  // creating the signup button
                  const SizedBox(height: 20),
                 

                ],
              ),




            ],
          ),
        ),
      ),
    );
  }
}