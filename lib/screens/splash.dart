import 'dart:ui';
import 'package:components/screens/login.dart';
import 'package:components/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 50;
    double height = MediaQuery.of(context).size.height / 2 - 100;

    return Scaffold(
      body: Stack(children: [
        Image.asset(
          "Splash2.jpeg",
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Align(
          alignment: Alignment(0.0, 0.9),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
            child: Container(
              padding: EdgeInsets.only(bottom: 50),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  border: Border.all(width: 2, color: Colors.white30)),
              width: width,
              height: height,
              child: Column(
                children: [
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(width - 50, 70)),
                    child: const Text("Log in"),
                    onPressed: () {
                      Get.to(const Login());
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.indigo,
                        textStyle: TextStyle(color: Colors.white),
                        minimumSize: Size(width - 50, 70)),
                    onPressed: () {
                      Get.to(const Register());
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
