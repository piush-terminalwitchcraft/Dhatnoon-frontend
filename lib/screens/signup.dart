// dummy SignUp page

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Image.asset("assets/login_bg.jpg",
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity),
            FadeInUp(
            child: Align(
              alignment: Alignment(-0.75, -0.8),
              child: Icon(
                Icons.arrow_back_sharp,
                size: 30,
                color: Colors.grey.shade600,
              ),
            ),
          ),
          FadeInUp(
            child: Align(
              alignment: Alignment(0.75, -0.8),
              child: Text(
                "Log In",
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          FadeInUp(
            child: Align(
              alignment: Alignment(-0.55, -0.55),
              child: Text(
                "Create\nAccount",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          FadeInUp(
            duration: Duration(milliseconds: 500),
            // delay: Duration(milliseconds: 1000),
            child: Align(
              alignment: Alignment(0.0, -0.22),
              child: Container(
                alignment: Alignment.center,
                width: 320,
                height: 80,
                child: Card(
                  elevation: 10,
                  child: ListTile(
                    minVerticalPadding: 20,
                    title: Text(
                      "User Name",
                      style: TextStyle(fontSize: 13,color: Colors.grey.shade500,),
                    ),
                    trailing: Icon(Icons.person_outline),
                  ),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white70, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Colors.white,
                ),
              ),
            ),
          ),
          FadeInUp(
            duration: Duration(milliseconds: 500),
            delay: Duration(milliseconds: 700),
            child: Align(
              alignment: Alignment(0.0, -0.035),
              child: Container(
                alignment: Alignment.center,
                width: 320,
                height: 80,
                child: Card(
                  elevation: 10,
                  borderOnForeground: false,
                  child: ListTile(
                      minVerticalPadding: 20,
                      title: Text(
                        "Phone",
                        style: TextStyle(fontSize: 13,color: Colors.grey.shade500,),
                      ),
                      trailing: Icon(Icons.phone_android)),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white70, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Colors.white,
                ),
              ),
            ),
          ),
          FadeInUp(
            duration: Duration(milliseconds: 500),
            delay: Duration(milliseconds: 700),
            child: Align(
              alignment: Alignment(0.0, 0.15),
              child: Container(
                alignment: Alignment.center,
                width: 320,
                height: 80,
                child: Card(
                  elevation: 10,
                  borderOnForeground: false,
                  child: ListTile(
                      minVerticalPadding: 20,
                      title: Text(
                        "E-Mail",
                        style: TextStyle(fontSize: 13,color: Colors.grey.shade500,),
                      ),
                      trailing: Icon(Icons.email_outlined)),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white70, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Colors.white,
                ),
              ),
            ),
          ),
          FadeInUp(
            duration: Duration(milliseconds: 500),
            delay: Duration(milliseconds: 700),
            child: Align(
              alignment: Alignment(0.0, 0.34),
              child: Container(
                alignment: Alignment.center,
                width: 320,
                height: 80,
                child: Card(
                  elevation: 10,
                  borderOnForeground: false,
                  child: ListTile(
                      minVerticalPadding: 20,
                      title: Text(
                        "Password",
                        style: TextStyle(fontSize: 13,color: Colors.grey.shade500,),
                      ),
                      trailing: Icon(Icons.password_outlined)),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white70, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Colors.white,
                ),
              ),
            ),
          ),
          FadeInUp(
            duration: Duration(milliseconds: 500),
            delay: Duration(milliseconds: 1000),
            child: Align(
              alignment: Alignment(0.0, 0.55),
              child: Container(
                width: 350,
                height: 80,
                alignment: Alignment.center,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(135, 20, 135, 20),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white70, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Colors.pink,
                ),
              ),
            ),
          ),
          FadeInUp(
            delay: Duration(milliseconds: 1100),
            child: Align(
              alignment: Alignment(0.0, 0.65),
              child: Text(
                "Or continue with",
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
            ),
          ),
           FadeInUp(
             delay: Duration(milliseconds: 1150),
            child: Align(
              alignment: Alignment(-0.7, 0.9),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(70, 18, 70, 18),
                  child: Text(
                    "G",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
          FadeInUp(
            delay: Duration(milliseconds: 1200),
            child: Align(
              alignment: Alignment(0.7, 0.9),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.blue.shade900,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(70, 18, 70, 18),
                  child: Text(
                    "f",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
