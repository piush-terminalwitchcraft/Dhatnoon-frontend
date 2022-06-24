// dummy SignUp page

import 'package:animate_do/animate_do.dart';
import 'package:components/screens/login.dart';
import 'package:components/utils/tabBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff270745),
            Color(0xff250543),
            Color(0xff170036),
            Color(0xff120032),
            Color(0xff120032),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
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
                alignment: Alignment(0.75, -0.81),
                child: InkWell(
                  onTap: () => Get.to(LogIn(), transition: Transition.downToUp),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Colors.grey.shade600,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Log In",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff120032),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
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
                    color: Colors.white
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
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade500,
                        ),
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
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey.shade500,
                          ),
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
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey.shade500,
                          ),
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
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey.shade500,
                          ),
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
                alignment: Alignment(0.0, 0.53),
                child: InkWell(
                  onTap: () => Get.to(MyHomePage(title: "title"),
                      transition: Transition.leftToRightWithFade),
                  child: Card(
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          color: Colors.white70,
                        ),
                        gradient: LinearGradient(
                          colors: [
                            Color(0xffcf366d),
                            Color(0xffaf44ae),
                            Color(0xff904fe5)
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(125, 20, 125, 20),
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
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
                     color: Colors.white
                  ),
                ),
              ),
            ),
            FadeInUp(
              delay: Duration(milliseconds: 1150),
              child: Align(
                alignment: Alignment(-0.7, 0.85),
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
                alignment: Alignment(0.7, 0.85),
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
      ),
    );
  }
}
