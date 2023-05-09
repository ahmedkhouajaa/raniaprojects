// TODO Implement this library.
// TODO Implement this library.
// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:raniaproject/signup_client.dart';
import 'dart:ui';

import 'constants.dart';
//import 'liste_reclamation.dart';


class Loginadmin extends StatelessWidget {
  const Loginadmin({super.key});

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

      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,

        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[


            Expanded(child: Column(

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

                    Text("Login",
                      style: TextStyle(  color:Colors.white,
                          fontSize: 30, fontWeight: FontWeight.bold),),
                    SizedBox(height: 20,),
                    Text(" to your account",
                      style: TextStyle(
                          fontSize: 15,
                          color:Colors.grey ),)
                  ],
                ),
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
                            hintText: "Password",hintStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.white,)
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(padding:
                const EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
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
                      onPressed: () {
                        //Navigator.push(context,
                       //   MaterialPageRoute(builder: (context) =>
                      //    Buying()));

                      },
                      color: const Color(0xFFFF5722),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),

                      ),
                      child: const Text(
                        "Login", style: TextStyle(
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
                    Text("Don't have an account?",style: TextStyle(
                      color: Colors.white,

                    )),
                    Text(" Sign up", style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color:Colors.white,

                    ),)
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child:GestureDetector(

                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return  SignupPage();
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

                Container(
                  padding: const EdgeInsets.only(top: 100),
                  height: 200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/background.png"),
                        fit: BoxFit.fitHeight
                    ),

                  ),
                ),



              ],
            ))
          ],
        ),
      ),
    );
  }

}

